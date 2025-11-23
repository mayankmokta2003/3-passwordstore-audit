---
title: Protocol Audit Report
author: Mayank
date: November 23, 2025
header-includes:
  - \usepackage{titling}
  - \usepackage{graphicx}
---

\begin{titlepage}
\centering
\begin{figure}[h]
\centering
\includegraphics[width=0.5\textwidth]{logo.pdf}
\end{figure}
\vspace\*{2cm}
{\Huge\bfseries Protocol Audit Report\par}
\vspace{1cm}
{\Large Version 1.0\par}
\vspace{2cm}
{\Large\itshape Cyfrin.io\par}
\vfill
{\large \today\par}
\end{titlepage}

\maketitle

<!-- Your report starts here! -->

Prepared by: [Cyfrin](https://cyfrin.io)
Lead Auditors:

- xxxxxxx

# Table of Contents

- [Table of Contents](#table-of-contents)
- [Protocol Summary](#protocol-summary)
- [Disclaimer](#disclaimer)
- [Risk Classification](#risk-classification)
- [Audit Details](#audit-details)
  - [Scope](#scope)
  - [Roles](#roles)
- [Executive Summary](#executive-summary)
  - [Issues found](#issues-found)
- [Findings](#findings)
- [High](#high)
- [Medium](#medium)
- [Low](#low)
- [Informational](#informational)
- [Gas](#gas)

# Protocol Summary

PasswordStore is a Protocol which stores one user's password and he can change the password and can view the password. Only the owner shoule be able to change or view the password.

# Disclaimer

The YOUR_NAME_HERE team makes all effort to find as many vulnerabilities in the code in the given time period, but holds no responsibilities for the findings provided in this document. A security audit by the team is not an endorsement of the underlying business or product. The audit was time-boxed and the review of the code was solely on the security aspects of the Solidity implementation of the contracts.

# Risk Classification

|            |        | Impact |        |     |
| ---------- | ------ | ------ | ------ | --- |
|            |        | High   | Medium | Low |
|            | High   | H      | H/M    | M   |
| Likelihood | Medium | H/M    | M      | M/L |
|            | Low    | M      | M/L    | L   |

We use the [CodeHawks](https://docs.codehawks.com/hawks-auditors/how-to-evaluate-a-finding-severity) severity matrix to determine severity. See the documentation for more details.

# Audit Details

**Below we have our commit hash**

```
63541e54586cca26e0a69b3ddc6b8fed150e7d2d
```

## Scope

```
./src/PasswordStore.sol
```

## Roles

- Owner: The user who can set password and view the password.
- Outsiders: No one should be able to read and set password expect Owner.

# Executive Summary

_Add some notes here telling how the audit went_

_We spent X hours with Y auditors using Z tools. etc_

## Issues found

| Severity | Number of issues found |
| -------- | ---------------------- |
| HIGH     | 2                      |
| MEDIUM   | 0                      |
| LOW      | 0                      |
| INFO     | 1                      |
| TOTAL    | 3                      |


# Findings

# High



# Medium

# Low

# Informational

# Gas
