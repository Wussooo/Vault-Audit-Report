# Vault.sol Reentrancy Vulnerability Report

## Critical Bug: ETH Drain via Reentrancy
The `withdraw()` function in `Vault.sol` allows attackers to steal all ETH via reentrancy.

### Files:
- [Vulnerable Contract](Vault.sol)
- [Exploit Code](Attack.sol)
- [Full Report](report.txt)
