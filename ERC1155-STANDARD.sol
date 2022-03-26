//SPDX-License-Identifier: un-licensed
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155Contract is ERC1155 {
    
    constructor() ERC1155("https://hodo.network/api/item/{id}.json") {
        
    }
    
    function mintNFT(address _to, uint256 _id, uint256 _amount, bytes memory _data) public returns(uint256) {
        require(_to != address(0), "caller address cannot be zero");
        _mint(_to, _id, _amount, _data);
        return _id;
    }
    
    function mintBatchNFT(address _to, uint256[] memory _ids, uint256[] memory _amount, bytes memory _data) public returns(uint256[] memory) {
        require(_to != address(0), "_to address cannot be zero");
        require(_ids.length == _amount.length, "ids must be equal to _amount quantity");
        
        _mintBatch(_to, _ids, _amount, _data);
        return _ids;
    }
    
}
