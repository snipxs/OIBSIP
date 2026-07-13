# Comprehensive Report: Common Network Security Threats

**Author:** Mopedi Hlongwane
**Track:** Cyber Security (OIBSIP)

---

## 1. Introduction

In today's hyper-connected digital landscape, network security is the foundational perimeter protecting an organization's most critical assets. As businesses rapidly migrate to cloud infrastructures and adopt remote work models, the attack surface has expanded exponentially. Network security threats matter because they do not merely disrupt IT operations; they cause severe financial hemorrhaging, compromise sensitive consumer data, and inflict lasting reputational damage. Understanding the mechanics, impact, and mitigation strategies for these threats is essential for maintaining the confidentiality, integrity, and availability of modern digital ecosystems.

---

## 2. Denial of Service (DoS) & Distributed Denial of Service (DDoS)

**How it Works:** A DoS attack aims to render a machine or network resource unavailable to its intended users by temporarily or indefinitely disrupting services. This is achieved by flooding the target with superfluous requests, thereby overloading its computational resources (CPU, memory) or network bandwidth. A DDoS attack amplifies this by utilizing a massive botnet—a network of compromised devices—to flood the target from thousands of different geographical locations simultaneously.

**Real-World Example:** The 2016 Dyn Cyberattack. Attackers utilized the Mirai botnet (composed largely of compromised IoT devices like IP cameras and routers) to launch a massive DDoS attack against Dyn, a major DNS provider.

**Impact:** The attack caused massive service outages across Europe and North America, taking down major platforms including Twitter, Reddit, Netflix, and Spotify for several hours, resulting in millions of dollars in lost revenue and massive service disruption.

**Specific Mitigation Strategies:**

- **Traffic Scrubbing & WAF:** Route traffic through cloud-based DDoS protection services (e.g., Cloudflare, AWS Shield) that filter out malicious packets before they reach the origin server.
- **Rate Limiting:** Implement strict rate limiting on routers and firewalls to restrict the number of requests a single IP address can make within a specific timeframe.
- **Anycast Network Routing:** Distribute incoming traffic across a massive distributed network of servers, absorbing the flood of traffic and preventing any single server from going offline.

---

## 3. Man-in-the-Middle (MITM) Attacks

**How it Works:** In a MITM attack, an adversary secretly intercepts and potentially alters the communication between two parties who believe they are directly communicating with each other. This often occurs on unsecured public Wi-Fi networks where attackers use packet sniffers or ARP spoofing to place themselves logically between the victim's device and the gateway router.

**Real-World Example:** The 2011 DigiNotar Breach. Hackers compromised the Dutch certificate authority DigiNotar and issued fraudulent SSL certificates for major domains like Google.com.

**Impact:** By using these fake certificates, the attackers successfully intercepted the Gmail communications of over 300,000 Iranian users, leading to catastrophic privacy breaches and the ultimate bankruptcy of the DigiNotar company.

**Specific Mitigation Strategies:**

- **Enforce HTTPS and HSTS:** Ensure all web traffic is encrypted using TLS/SSL, and implement HTTP Strict Transport Security (HSTS) to prevent browsers from loading pages over unencrypted HTTP connections.
- **Virtual Private Networks (VPNs):** Require employees to use enterprise-grade VPNs (with end-to-end encryption) when accessing company assets over public or untrusted networks.
- **Network Authentication:** Implement robust Wi-Fi security protocols (WPA3 Enterprise) and use certificate-based authentication (802.1X) to prevent rogue devices from joining the corporate network.

---

## 4. IP Spoofing

**How it Works:** IP spoofing involves creating Internet Protocol (IP) packets with a forged source IP address. Attackers use this technique to conceal their true identity, bypass IP-based firewall restrictions, or impersonate a trusted machine on the network. It is frequently used in conjunction with DDoS amplification attacks (where responses to spoofed requests are sent to the victim).

**Real-World Example:** The 2018 GitHub Memcached DDoS Attack. Attackers spoofed GitHub's IP address and sent small requests to thousands of vulnerable Memcached servers across the internet.

**Impact:** Because the requests were spoofed, the Memcached servers sent their massive responses (amplified by a factor of 51,000) directly to GitHub, resulting in a record-breaking 1.35 Tbps DDoS attack that temporarily took the platform offline.

**Specific Mitigation Strategies:**

- **Ingress and Egress Filtering:** Implement router filters (BCP 38) to drop inbound packets that appear to originate from inside the network, and drop outbound packets that do not have a valid internal source IP.
- **IPsec Protocol:** Implement IPsec with Authentication Headers (AH) to cryptographically verify the origin and integrity of every packet moving across the network.
- **Transition to Zero Trust:** Move away from perimeter-based security that inherently trusts internal IP addresses, requiring strict multi-factor authentication (MFA) regardless of the user's IP.

---

## 5. DNS Poisoning (DNS Spoofing)

**How it Works:** DNS poisoning occurs when a malicious actor alters the Domain Name System (DNS) records in a resolver's cache. When a victim attempts to visit a legitimate website (e.g., banking.com), the poisoned DNS server resolves the domain to the IP address of a malicious server controlled by the attacker, redirecting the user seamlessly.

**Real-World Example:** The 2018 MyEtherWallet Attack. Attackers hijacked Amazon's Route 53 DNS servers via a BGP exploit, poisoning the DNS resolution for MyEtherWallet.com.

**Impact:** Users attempting to log into their cryptocurrency wallets were redirected to a Russian server hosting a fake phishing clone of the site. The attackers harvested credentials and stole approximately $152,000 worth of cryptocurrency before the hijack was resolved.

**Specific Mitigation Strategies:**

- **Implement DNSSEC:** Deploy Domain Name System Security Extensions (DNSSEC), which uses digital signatures to guarantee the authenticity and integrity of DNS responses.
- **DNS Spoofing Detection Tools:** Utilize intrusion detection systems (IDS) configured to monitor for unusual DNS response times, mismatched IP allocations, and TTL (Time to Live) anomalies.
- **End-to-End Encryption:** While encryption does not prevent the redirection itself, strict TLS enforcement ensures the user's browser will throw an invalid certificate warning when landing on the attacker's fake server.

---

## 6. Threat Comparison Matrix

| Threat Category | Primary Attack Vector | Who is Most at Risk? | Difficulty to Execute | Ease of Mitigation |
|---|---|---|---|---|
| **DDoS** | Botnets, Resource exhaustion | E-commerce, SaaS, High-profile platforms | Low (DDoS-for-hire services) | Medium (Requires costly infrastructure/WAFs) |
| **MITM** | Public Wi-Fi, ARP spoofing | Remote workers, Unencrypted mobile apps | Medium (Requires network proximity) | Easy (HTTPS/VPN enforcement) |
| **IP Spoofing** | Packet manipulation | Legacy systems utilizing IP authentication | High (Requires raw socket programming) | Medium (Requires ISP-level filtering) |
| **DNS Poisoning** | Cache injection, BGP hijacking | Financial institutions, Crypto exchanges | High (Requires exploiting infrastructure timing) | Hard (Requires global DNSSEC adoption) |

---

## 7. Conclusion: Key Takeaways for Network Administrators

1. **Assume Breach & Adopt Zero Trust:** Never inherently trust a connection simply because it originates from an internal IP address. Implement strict identity verification for every resource request.
2. **Defense in Depth is Mandatory:** No single appliance can stop all attacks. Administrators must layer their defenses—combining Endpoint Detection and Response (EDR), WAFs, robust VPNs, and router-level filtering.
3. **Encryption is the Ultimate Failsafe:** While network manipulation (like MITM and DNS Poisoning) is difficult to eradicate completely, enforcing strong end-to-end encryption (TLS/HTTPS) ensures that even if traffic is intercepted or misrouted, the payload remains unreadable and useless to the attacker.

---

## 8. References

- NIST (National Institute of Standards and Technology). (2023). *Guide to General Server Security.* Special Publication 800-123.
- CISA (Cybersecurity and Infrastructure Security Agency). (2022). *Understanding Denial-of-Service Attacks.* Security Tip (ST04-015).
- SANS Institute. (2020). *The State of Network Security.* SANS Reading Room.
- MITRE ATT&CK Framework. (2023). *Adversary Tactics and Techniques: Network Effects (TA0009).*
