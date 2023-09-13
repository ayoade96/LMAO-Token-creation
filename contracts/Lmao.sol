// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract Lmao is ERC20 ("AY","DMZ") {
    address owner;

    constructor() {
        owner = msg.sender;
        _mint(owner, 10000e18);
    }

    function _transfer(address from, address to, uint amount) internal virtual override {
        uint fee = (8 * amount)/100;
        uint remainingBalance = amount - fee;
        super._transfer(from,to,remainingBalance);
        super._transfer(from, owner, fee);
    }
}

contract Wlmao is ERC20("DAMBA", "DMB") {
    IERC20 LMAO;
    constructor(address _LMAO) {
        LMAO = IERC20(_LMAO);
    }

    function depositLmao (uint _amount)public {
        LMAO.transferFrom(msg.sender, address(this), _amount);
        uint calculate = (92 * _amount)/100;
        _mint(msg.sender, calculate);
    }


   function swapBack(uint _amount)public{
    require(balanceOf(msg.sender) >= _amount, "must be greater than amount");
    LMAO.transfer(msg.sender, _amount);
    _burn(msg.sender, _amount);
   }
}