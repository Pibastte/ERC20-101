pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExerciceSolution is ERC20
{
    constructor(uint256 supply, string memory symbol, string memory, string memory name) public ERC20(name, symbol) {
        _mint(msg.sender, 1000);
    }

    function getToken() external returns (bool) {
        return true;
    }

    function buyToken() external payable returns (bool) {
        return true;
    }

    function isCustomerWhiteListed(address customerAddress) external returns (bool) {
        return true;
    }

    function customerTierLevel(address customerAddress) external returns (uint256) {
        return 2;
    }
}
