pragma solidity >=0.8.17;

contract Store {
    uint256 storedValue;

    // Function to set the value
    function setValue(uint256 newValue) public {
        storedValue = newValue;
    }


                      uint num = 20;
                 uint number = 10;
    // Function to get the value
    function getValue() public view returns (uint256) {
        return storedValue;
    }

}
