Muninn Huginn OSINT

Muninn Huginn OSINT is a lightweight OSINT (Open Source Intelligence) reconnaissance tool written in Bash.

The tool allows users to search for usernames across multiple social media platforms and online services.

Inspired by the two ravens of Odin from Norse mythology:

- Huginn — Thought
- Muninn — Memory

According to mythology, these ravens travel across the world gathering information and reporting it back to Odin.
This tool follows the same idea by collecting publicly available information from different online platforms.

Repository:
https://github.com/DanielQuintanillaPaniagua/muninn_huginn_Osint

---

Features

- Username search across multiple platforms
- Interactive command-line interface
- Colored terminal output
- Multi-platform OSINT reconnaissance
- Automated profile checking using HTTP requests

Supported platforms:

- LinkedIn
- Facebook
- Instagram
- Twitter / X
- GitHub
- YouTube
- TikTok
- Reddit
- Pinterest
- Telegram

---

Installation

Clone the repository:

git clone https://github.com/DanielQuintanillaPaniagua/muninn_huginn_Osint.git
cd muninn_huginn_Osint

Give execution permission:

chmod +x muninn_huginn.sh

Run the tool:

./muninn_huginn.sh

---

Usage

After launching the script, the program will display an interactive menu:

1) Search LinkedIn
2) Search YouTube
3) Search Facebook
4) Search Instagram
5) Search Twitter/X
6) Search GitHub
7) Search all platforms
8) Exit

Choose an option and enter the username you want to investigate.

The script will attempt to verify whether that username exists on multiple platforms.

---

Requirements

- Linux / Unix-based system
- Bash
- curl
- Internet connection

Most Linux distributions already include these tools by default.

---

Project Structure

muninn_huginn_Osint
│
├── muninn_huginn.sh
└── README.md

---

Disclaimer

This tool is intended for educational and research purposes only.

Users must respect privacy laws and platform terms of service.
The author is not responsible for misuse of this software.

---

Author

Daniel Quintanilla Paniagua
Computer Systems and Network Engineering Student

GitHub:
https://github.com/DanielQuintanillaPaniagua

---

License

MIT License
