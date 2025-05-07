// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
contract DAOVotingSystem {
    enum ProposalStatus {
        Active,
        Deactive
    }
    enum VotersStatus {
        NotRegistered,
        Registered,
        Eligible,
        Revoked
    }
    address Admin;
    struct Proposal {
        string Description;
        uint256 VoteCount;
        ProposalStatus status;
    }
    uint256 maxVote = 0;
    uint256 [] winners;
    constructor () {
        Admin = msg.sender;
    }
    modifier onlyAdmin() {
        require(msg.sender == Admin, "You are not admin");
        _;
    }
    modifier onlyMember() {
        require(msg.sender != Admin, "You are not a member");
        _;
    }
    mapping (address => VotersStatus) public votersStatus;
    mapping (uint => Proposal) public proposals;
    mapping (address => mapping (uint => bool)) public votersAddress;
    uint256 public proposalId;
    event ProposalCreated(address indexed _creatorAddress, string _description, uint256 _proposalID);
    event ProposalDeactivated(uint256 _proposalID);
    event UserRegistered(address indexed _userAddress);
    event Voted(address indexed _userAddress, uint256 _proposalID);
    event UserStatusChanged(address indexed _userAddress, VotersStatus _voterstatus);
    function registerYourself () public {
        require (votersStatus[msg.sender] == VotersStatus.NotRegistered,"You have already registered");
        votersStatus[msg.sender] = VotersStatus.Registered;
        emit UserRegistered(msg.sender);
    }
    function checkEligibility (address _voterAddress, VotersStatus _voterStatus) external onlyAdmin {
        require (_voterStatus == VotersStatus.Eligible || _voterStatus == VotersStatus.Revoked, "Status should be eligible or revoked");
        require (uint8(_voterStatus) <= 3 ,"Incorrect status");
        votersStatus[_voterAddress] = _voterStatus;
        emit UserStatusChanged (_voterAddress, _voterStatus);
    }
    function createProposal (string memory _description) external onlyAdmin {
        proposals [proposalId] = Proposal(_description,0, ProposalStatus.Active);
        proposalId++;
        emit ProposalCreated(msg.sender, _description, proposalId);
    }
    function voting (bool _vote, uint256 _proposalID) public onlyMember {
        require (votersStatus[msg.sender]== VotersStatus.Eligible,"You are not eligible to vote");
        require(_proposalID < proposalId, "Proposal ID is incorrect");
        require(proposals[_proposalID].status == ProposalStatus.Active, "This proposal is not active");
        require (!votersAddress[msg.sender][_proposalID] ,"You have already voted for this proposal");
        votersAddress[msg.sender][_proposalID] = true;
        if (_vote){
            proposals[_proposalID].VoteCount += 1;
        }
        if (proposals[_proposalID].VoteCount == maxVote) {
            winners.push (_proposalID);
        }
        else if (proposals[_proposalID].VoteCount > maxVote) {
            maxVote = proposals[_proposalID].VoteCount;
            delete winners;
            winners.push (_proposalID);
        }
        emit Voted(msg.sender, _proposalID);
    }
    function deactiveProposal (uint256 _proposalID) public onlyAdmin {
        require(proposals[_proposalID].status == ProposalStatus.Active, "This proposal is already deactivated");
        proposals[_proposalID].status = ProposalStatus.Deactive;
        emit ProposalDeactivated(_proposalID);
    } 
    function winnerInfo ()external view returns (uint256, uint[] memory) {
        return (maxVote, winners);
    }
}
