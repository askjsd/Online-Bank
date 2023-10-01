// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

import "./consultant.sol";

contract Pay is Consultant {

    

    function requestOrder(uint amount, uint spend, address payable to) public returns (bool) {
        //uint random = 5;
        
        if ((spend * 2) >= amount)
        {
            if (spend >= amount)
            {
                accounts[0].badQuestion++;
                if (accounts[0].badQuestion >= 5)
                {
                    accounts[0].money = accounts[0].money - 20;
                }
            }
            return false;
        }       
        submitOrder(spend, to);
      return true;

    }

    function submitOrder(uint spend, address payable to) public
    {
        spend = spend * (1 ether);
        accounts[0].money = accounts[0].money - spend;
        to.transfer(spend);
    }

}