// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
contract QuestBoard {
    struct Quest {
        string Description;
        uint256 Reward;
        address Creator;
        address ClaimedBy;
        bool Completed;
    }
    mapping (address => uint256) public rewards;
    mapping (uint256 => Quest) public questId;
    uint256 questCount;
    event QuestCreated (address indexed CreatorAddress, string QuestDescription, uint256 questID);
    event QuestClaimed (address indexed ClaimedAddress, uint256 questID);
    event QuestCompleted (address indexed ClaimedAddress, uint256 Reward, uint256 questID);
    function createQuest (string memory _Description, uint256 _Reward) public {
        questCount++;
        questId[questCount] = Quest(_Description, _Reward, msg.sender,address(0), false);
        emit QuestCreated(msg.sender, _Description, questCount);
    }
    
    function claimQuest(uint256 _questid) public {
        require (questId[_questid].Creator != msg.sender, "Creator of a quest can not claim it");
        require (questId[_questid].ClaimedBy == address(0), "This quest has already been claimed ");
        questId[_questid].ClaimedBy = msg.sender;
        emit QuestClaimed(msg.sender, _questid);
    }
    function checkCompleted (bool _completed, uint256 _questid) public {
        require (msg.sender == questId[_questid].Creator, "Only the creator can confirm the completion of a quest");
        questId[_questid].Completed = _completed;
    }
    function saveReward (uint256 _questid) public {
        require (msg.sender == questId[_questid].ClaimedBy, "Only the claimer can claim the reward");
        require (questId[_questid].Completed,"You did not complete the quest");
        require (questId[_questid].Reward > 0, "Quest has already been claimed or has invalid reward");
        rewards[msg.sender] += questId[_questid].Reward;
        emit QuestCompleted(msg.sender, questId[_questid].Reward, _questid);
        questId[_questid].Reward = 0;
    }
