//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Owner {

    address private owner;
    event OwnerSet(address indexed newOwner, address indexed oldOwner); 

    constructor()  {
        owner = msg.sender;
        emit OwnerSet(address(0), owner);
    }
    
    modifier isOwner(){
        require(msg.sender == owner , "Only the owner can perform this action");
        _;
    }

    function changeOwner(address newOwner) public isOwner{
        emit OwnerSet(newOwner, owner);
        owner = newOwner;

    }
    function getOwner() external view returns(address){
        return owner;
    }
}
