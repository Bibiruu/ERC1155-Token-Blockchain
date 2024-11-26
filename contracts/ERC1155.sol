// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract ERC1155 {
    //mapping from tokenID to accounts balances: input tokenId => user address, returning balance
    mapping(uint256 => mapping(address => uint256)) internal _balances;

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
    ) public view returns (uint256) {
        uint256[] memory batchBalances = new uint256[](accounts.length);

        for (uint256 i = 0; i < accounts.length; i++) {
            return batchBalances[i] = balanceOf(accounts[i], ids[i]);
        }
    }

    // setApprovalForAll()
    // isApprovedForAll()
    // safeTransferFrom()
    // safeBatchTransferFrom()

    // TransferSingle()
    // TransferBatch()
    // ApprovalForAll()
    // URI()
}
