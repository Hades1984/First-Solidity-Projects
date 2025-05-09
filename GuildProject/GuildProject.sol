// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
contract GuildRegistry{    
    address public admin;
    enum Role {
        Member,
        Admin
    }
    struct Player {
        uint256 PlayerLevel;
        string PlayerName;
        Role PlayerRole;
    } 
    mapping (address=>Player) public playerInfo;
    construtor () {
        admin = msg.sender;
        playerInfo[msg.sender] = Player(0, "First Admin", Role.Admin);
    }
    event  PlayerRegistered (address indexed playerAddress, string playerName);
    event  PlayerLeveledUp (address indexed playerAddress, uint newLevel);
    event  PlayerDeleted (address indexed playerAddress);
    event  AdminChanged (address indexed newAdminAddress);
    modifier existenceCheck {
        require (bytes(playerInfo[msg.sender].PlayerName).length > 0, "No Such Player Exist");
        _;
    }
    modifier alreadyExist (address _player){
        require (bytes(playerInfo[_player].PlayerName).length == 0, "Player Already Registered");
        _;
    }
    modifier onlyAdmin {
        require (playerInfo[msg.sender].PlayerRole == Role.Admin, "Only admin can perform this action");
        _;
    }
    modifier onlyMember {
        require (playerInfo[msg.sender].PlayerRole == Role.Member, "Only member can perform this action");
        _;
    }  
      function register(address _player, string memory _name) public onlyAdmin alreadyExist (_player) {
        playerInfo[_player] = Player(1, _name, Role.Member);
        emit PlayerRegistered (_player, _name);
    }
    function levelUp() public existenceCheck () onlyMember {
        playerInfo[msg.sender].PlayerLevel++; 
        emit PlayerLeveledUp (msg.sender, playerInfo[msg.sender].PlayerLevel);
    }
    function leaveGuild() public existenceCheck () onlyMember {
        require(msg.sender !=admin,"Admin Can Not Leave the Guild");
        delete playerInfo[msg.sender];
        emit PlayerDeleted(msg.sender);
    }
    function changeAdmin(address _newAdmin) public existenceCheck () onlyAdmin {
        require(_newAdmin != address(0), "Invalid New Admin Address");
        playerInfo[_newAdmin].PlayerRole = Role.Admin;
        admin = _newAdmin;
        emit AdminChanged(_newAdmin);
    }
}
    
