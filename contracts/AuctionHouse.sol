// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {AccessControl} from "../lib/openzeppelin-contracts/contracts/access/AccessControl.sol";

contract AuctionHouse {
    address Auctioneer;

    modifier onlyAuctioneer() {
        require(Auctioneer == msg.sender, "YOU ARE NOT THE AUCTIONEER!!");
        _;
    }

    struct Item
    {
        uint256 ID;
        string name;
        string description;
    }

    Item[] public items;

    function setItem(uint256 id_, string memory name_, string memory desc_) public onlyAuctioneer{
        Item newItem = Item({
            ID: id_,
            name: name_,
            description:desc_
        });
        items.push(newItem);
    }
}
