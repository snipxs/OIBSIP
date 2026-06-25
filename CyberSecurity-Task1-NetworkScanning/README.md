# Task 1: Basic Network Scanning with Nmap
## Project Overview

This project demonstrates how Nmap can be used to perform reconnaissance on a local network. The goal is to identify open ports, the services those ports are running, and the operating system of a target machine within a virtual network. I used a Kali Linux VM as my attack box and used Metasploit 2 as the target machine. These machines were running in my virtual network created by my hypervisor (VirtualBox).

---
## Table of Contents
- [What is Nmap?](#what-is-nmap)
- [Installation and Setup](#installation-and-setup)
- [Ethical Use Guidelines](#ethical-use-guidelines)
- [Repository Contents](#repository-contents)

---
## What is Nmap?

Nmap is an open-source security auditing and network discovery tool that uses raw IP packets to determine:
- What hosts are available on a network
- What services those hosts are offering
- What operating system the target is running

---
## Installation and Setup

### Linux (Ubuntu/Debian-based)

Run the following commands in your terminal:

```bash
sudo apt update
sudo apt install nmap
```

> **Note:** Nmap comes pre-installed on Kali Linux.

### Windows / macOS

Nmap can be downloaded from the official site: [https://nmap.org/download.html](https://nmap.org/download.html)

---
## Ethical Use Guidelines

>  **Important:** Always use Nmap responsibly and legally.
- **Do not** scan public, external, or production networks without the explicit written permission of the network owner.
- **Do not** scan unauthorized targets — this is illegal in many jurisdictions and may be interpreted as a cyber attack.
- All scans conducted in this demonstration were performed on my own virtual machine within a private, isolated network.

---
## Repository Contents

| File / Folder | Description |
|---|---|
| `nmap_scan_results.txt` | Detailed analysis of open ports and services discovered |
| `/Screenshots` | Terminal output screenshots verifying scan execution (`-sV` and `-O` flags) |
