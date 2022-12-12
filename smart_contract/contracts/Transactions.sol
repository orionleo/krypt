// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Transactions{
    uint256 transactionCount;

    event Transfer(address from , address receiver , uint amount, string message, uint256 timeStamp, string keyword );

    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timeStamp;
        string keyword;
    }

    TransferStruct[] transactions;

    function addToBlockChain(address payable receiver,uint amount, string memory message,string memory keyword) public {
        transactionCount+=1;
        transactions.push(TransferStruct(msg.sender,receiver,amount,message,block.timestamp,keyword));

        emit Transfer(msg.sender,receiver,amount,message,block.timestamp,keyword);
    }

    function getAllTransactions() public view returns (TransferStruct[] memory) {
        //returns transactions
        return transactions;
    }

    function getTransactionCount() public view returns (uint256 ) {
        //returns transaction count
        return transactionCount;
    }
}
