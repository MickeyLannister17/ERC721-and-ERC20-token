// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BravosToken is ERC20, Ownable {
    uint rate;
    uint FixedSupply;
    //address owner;
    constructor() ERC20 ("BravosToken", "BTK") {
        rate = 1000;
        FixedSupply = 1000000 * 10 ** 18;
        // owner = msg.sender;
        _mint(msg.sender, 5000 *10 ** 18);
    }
function buyToken(address receiver) public payable {
        require (msg.value > 0, "funds");
        uint amountToBuy = msg.value * rate;
        require (FixedSupply >= (totalSupply() + amountToBuy), "Must not be more than the fixed supply" );
        _mint(receiver, amountToBuy);
    }
}