// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/utils/Strings.sol";

contract Consultant {
    struct Account {
        string name;
        uint money;
        uint debt;
        uint badQuestion;
        uint goodBuys;
    }

    Account[] public accounts;

    mapping (uint => address) public accountToOwner;
    mapping (address => uint) ownerAccounts;

    event NewAccount(string name, uint deposit);

    function createAccount(string memory name, uint deposit) external payable
    {
      
        require (msg.value == deposit * (1 ether));
        accounts.push(Account(name, deposit, 0, 0, 0));
        uint num = accounts.length - 1; 

        accountToOwner[num] = msg.sender;
      
        ownerAccounts[msg.sender] = ownerAccounts[msg.sender]++;

        emit NewAccount(name, deposit);
    
    }

    function requestOrder(address user, uint spend, address payable to) public returns (bool) {
        uint id = ownerAccounts[user];
        uint amount = accounts[id].money;
        if ((spend * 2) >= amount)
        {
            if (spend >= amount)
            {
                accounts[id].badQuestion++;
                if (accounts[id].badQuestion >= 5)
                {
                    accounts[id].money = accounts[id].money - (1 ether);
                    accounts[id].badQuestion = 0;
                }
            }
            return false;
        }  
        accounts[id].money = accounts[id].money - spend;
        accounts[id].goodBuys++;
        to.transfer(spend * (1 ether));
      return true;

    }


    //getter methods for the amount of money, number of bad requests, or smart purchases a user has
    function getMoney(address user) public view returns (uint) {
        
        uint id = ownerAccounts[user];
        return accounts[id].money;
    }

    function getBadQuestions(address user) public view returns (uint) {
        uint id = ownerAccounts[user];
        return accounts[id].badQuestion;
    }

     function getGoodBuys(address user) public view returns (uint) {
        uint id = ownerAccounts[user];
        return accounts[id].goodBuys;
    }

    function requestRewards(address user) public returns (bool) {
        uint id = ownerAccounts[user];
        if (accounts[id].goodBuys >= 10)
        {
            accounts[id].money = accounts[id].money + (1 ether);
            return true;
        }

        return false;
    }
    
     
}