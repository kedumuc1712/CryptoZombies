pragma solidity ^0.4.19;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {
	uint levelUpFee = 0.001 ether;

	modifier aboveLevel(uint _level, uint _zombieId) { 
		require (zombies[_zombieId].level >= _level); 
		_; 
	}

	function withdraw() external onlyOwner {
		owner.transfer(this.balance);
	}

	function setLevelUpFee(uint _fee) external onlyOwner {
		levelUpFee = _fee;
	}

	function levelUp(uint _zombieId) external payable {
		require (msg.value == levelUpFee);
		zombies[_zombieId].level++;
	}

	function changeName(uint _zombieId, string _newName) external aboveLevel(2, _zombieId) onlyOwnerOf(_zombieId) {
		zombies[_zombieId].name = _newName;
	}

	function changeDna(uint _zombieId, uint _newDna) external onlyOwnerOf(_zombieId) {
		zombies[_zombiesId].dna = _newDna;
	}

	function getZombiesByOwner(address _owner) external view returns (uint[]) {
		uint[] memory result = new uint[](ownerZombieCount[_owner]);
		uint counter = 0;
		for (uint i = 0; i < zombies.length; i++) {
			if (zomboieToOwner[i] == _owner) {
				result[counter] = i;
				counter++;
			}
		}
		return result;
	} 
	
}