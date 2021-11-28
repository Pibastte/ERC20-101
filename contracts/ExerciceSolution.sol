pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExerciceSolution is ERC20
{
    mapping(address => bool) public whiteList;
    mapping(address => uint32) public tierLevels;

    constructor(string memory name, string memory symbol,uint256 initialSupply) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
        whiteList[address(0xcff8985FF63cDce92036A2747605FB7ead26423e)] = true;
        tierLevels[address(0xcff8985FF63cDce92036A2747605FB7ead26423e)] = 2;
    }

    function getToken() external returns (bool) {
        _mint(msg.sender, 1000);
    }

    function buyToken() external payable onlyWhiteList returns (bool)
    {
        _mint(msg.sender, msg.value * tierLevels[msg.sender]);
    }

    function isCustomerWhiteListed(address customerAddress) external view returns (bool) {
        return whiteList[customerAddress];
    }

    function setWhiteList(address whiteListAddress, bool isWhiteList)
    public
    {
        whiteList[whiteListAddress] = isWhiteList;
    }

    function setTierList(address tierListAddress, uint8 tierLevelAmount)
    public
    {
        tierLevels[tierListAddress] = tierLevelAmount;
    }

    function customerTierLevel(address customerAddress) external view returns (uint256) {
        return tierLevels[customerAddress];
    }

    modifier onlyWhiteList() {
        require(whiteList[msg.sender]);
        _;
    }
}
