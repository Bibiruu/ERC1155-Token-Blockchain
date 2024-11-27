// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract ERC1155 {


     // TransferSingle()
    // TransferBatch()
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);
    // URI()

    //mapping from tokenID to accounts balances: input tokenId => user address, returning balance
    mapping(uint256 => mapping(address => uint256)) internal _balances;
    //mapping from account to operator approvals. owner => operator => true or false
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    //gets the balance of accounts tokens
    function balanceOf(
        address account,
        uint256 id
    ) public view returns (uint256) {
        require(account != address(0), "Address is zero");
        return _balances[id][account];
    }

    //gets the balance of accounts tokens
    function balanceOfBatch(
        address[] memory accounts,
        uint256[] memory ids
    ) public view returns (uint256[] memory) {
        require(accounts.length == ids.length, "Accounts and ids are not the same length");
        uint256[] memory batchBalances = new uint256[](accounts.length);

        for(uint256 i = 0; i < accounts.length; i++) {
            batchBalances[i] = balanceOf(accounts[i], ids[i]);
        }
        return batchBalances;
    }

    //enables or disables an operator to manage all of msg.senders assets
    function setApprovalForAll(address operator, bool approved) public {
        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator , approved);
    }
    //checks if an address is an operator or another address
    function isApprovedForAll(address account, address operator) public view returns(bool) {
        //checking if the operator is tru for the account
        return _operatorApprovals[account][operator];
    }

    //
    function _transfer(address from, address to, uint256 id, uint256 amount) private{
        uint256 fromBalance = _balances[id][from];
    }

    //
    function safeTransferFrom() {

    }
    // safeBatchTransferFrom()

}
