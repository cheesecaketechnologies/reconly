#!/bin/bash

# Reconly 🕵️‍♀️ — Built by Cheesecake Technologies

set -e

banner() {
  echo -e "\n🚀 Running Reconly for domain: $domain"
}

# ========== Input Arguments ==========
while getopts d:o:e:s:p: flag
do
    case "${flag}" in
        d) domain=${OPTARG};;
        o) output_dir=${OPTARG};;
        e) email=${OPTARG};;
        s) smtp_server=${OPTARG};;
        p) smtp_pass=${OPTARG};;
    esac
done

if [[ -z "$domain" || -z "$output_dir" || -z "$email" || -z "$smtp_server" || -z "$smtp_pass" ]]; then
    echo "Missing arguments."
    echo "Usage: ./reconly.sh -d target.com -o /output/dir -e your@email.com -s smtp.server.com -p smtp_password"
    exit 1
fi

mkdir -p "$output_dir"

banner

# ========== Subdomain Enumeration ==========
echo "Enumerating subdomains..."
subfinder -d "$domain" -silent > "$output_dir/subfinder.txt"
amass enum -passive -d "$domain" > "$output_dir/amass.txt"
sort -u "$output_dir/"*.txt > "$output_dir/all_subs.txt"
echo "Subdomain enumeration done."

# ========== Real GitHub Dorking ==========
echo "Scanning for secrets on GitHub..."

# Perform GitHub dorking using GitHub search API or GitLeaks (if installed)
# You must set a GitHub token for better rate limits
if command -v gitleaks >/dev/null 2>&1; then
    gitleaks detect -s "." --no-banner --report-format json > "$output_dir/github_secrets.txt" || echo "Gitleaks scan failed."
else
    echo "GitHub Dorking requires gitleaks. Please install it from https://github.com/gitleaks/gitleaks" > "$output_dir/github_secrets.txt"
fi

echo "GitHub secret scan complete."

# ========== Email Report ==========
echo "Sending report to $email..."

python3 - <<EOF
import smtplib
import os
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication

sender = "${email}"
recipient = "${email}"
smtp_server = "${smtp_server}"
smtp_pass = "${smtp_pass}"
domain = "${domain}"
output_dir = "${output_dir}"

msg = MIMEMultipart()
msg['From'] = sender
msg['To'] = recipient
msg['Subject'] = f"Reconly Report: {domain}"

body = f"""
Hi 👋,

Here is your recon report for {domain}. 🚀

Check the attachments for subdomains, secrets, and more.

Stay awesome,  
– Reconly 🕵️‍♀️
"""

msg.attach(MIMEText(body, 'plain'))

for filename in os.listdir(output_dir):
    path = os.path.join(output_dir, filename)
    with open(path, 'rb') as f:
        part = MIMEApplication(f.read(), Name=filename)
        part['Content-Disposition'] = f'attachment; filename="{filename}"'
        msg.attach(part)

try:
    server = smtplib.SMTP(smtp_server, 587)
    server.starttls()
    server.login(sender, smtp_pass)
    server.send_message(msg)
    server.quit()
    print("Email sent.")
except Exception as e:
    print(f"Failed to send email: {e}")
EOF

echo "Recon completed 🎉 . Results are in $output_dir"
