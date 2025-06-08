Reconly 🕵️‍♀️ — Automated Bug Bounty Recon That Actually Saves You Time  
Built with ❤️ by Cheesecake Technologies

⚡ What is Reconly?

Reconly is your ethical recon buddy. Whether you're a bug bounty hunter burning the midnight oil,  
or a DevSecOps engineer stuck in endless triage loops, this tool runs recon automatically — while you sleep,  
while you eat, or while you scream into the void.

No bloated UIs. No snake oil. Just raw, efficient automation that works.

🔍 Key Features

- 🔗 Automated Subdomain Enumeration (using `subfinder`, `amass`, `dnsx`, and more)  
- 🔑 GitHub Dorking + Secrets Detection (via GitHub API & regex)  
- 🌐 Scope-Safe Recon Only — you define the rules, we follow them  
- 🎥 Optional PoC Video Generation (for reports or bragging rights)  
- 🧠 Smart CVSS Scoring + Custom Risk Labels  
- 📬 Email Summary Reports to keep you informed without hogging your terminal  
- 💡 Modular — use it out of the box, or plug in your favorite tools  

🎯 Who’s It For?

- 🧑‍💻 Bug Bounty Hunters who want faster, cleaner output  
- 🛡️ DevSecOps Teams that need structured pipelines, not chaos  
- 🧠 Learners looking for a practical recon setup  
- 🔐 Startups & SMBs without in-house security — set it up and sleep better  

📦 Installation

```bash
git clone https://github.com/cheesecaketechnologies/reconly.git
cd reconly
chmod +x install.sh reconly.sh
./install.sh
```

🛠️ Requirements: Kali Linux or any Debian-based OS, Go (1.20+), Python 3, and `sendmail` or `msmtp` for email support.

🚀 Usage

```bash
./reconly.sh -d target.com -o /path/to/output -e your@email.com
```

Flags explained:  
- `-d` → Target domain (e.g. example.com)  
- `-o` → Output directory  
- `-e` → Your email address to receive reports (optional)

Or just:

```bash
make it dance 🕺
```

🕺 This is just a fun way to say: automate recon like a boss.

⚠️ Legal Notice

Reconly is strictly for authorized, ethical testing only.  
You must have explicit permission to scan the targets you're testing.  
Cheesecake Technologies is not responsible for misuse or illegal activity.

Disclaimer

This tool is intended for use in authorized bug bounty programs only. You must have explicit permission to test and report vulnerabilities on any system you use this tool with. Unauthorized use of this tool on systems without permission may be illegal and could result in criminal or civil penalties.

The authors and contributors of this project are not responsible for any misuse or damage caused by this tool. Always comply with all applicable laws and the terms of any bug bounty program you participate in.

📬 Stay in the Loop

Get updates and early access to the paid SaaS version:  
[Follow us on LinkedIn](https://linkedin.com/company/14605881)

❤️ Support This Project

If Reconly saved you hours — or landed you a bounty — consider:  
- ⭐ Starring this repo  
- ☕ Buying us a coffee (coming soon)  
- 🧠 Opening an issue or submitting a PR  

Built to help ethical hackers automate more, worry less, and earn faster.
