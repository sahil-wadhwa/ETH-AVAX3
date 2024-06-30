// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public owner;
    constructor() ERC20("MyToken", "MTK") {
        owner = msg.sender;
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint100(address to, uint256 amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        require(amount != 0,"Enter a valid amount");
        _mint(to, amount*100);//mints 100 times as a bonus
    }

    function transfer120(address recipient, uint256 amount) public returns (bool) {
        require(amount != 0,"Enter a valid amount");
        _transfer(_msgSender(), recipient, amount+120);//burns 120 extra as a transaction fee
        return true;
    }

    function burn120(uint256 amount) public {
        require(amount != 0,"Enter a valid amount");
        _burn(msg.sender, amount+120);//burns 120 extra as a transaction fee
    }

}
