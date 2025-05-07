# DAO Voting System

A simple DAO (Decentralized Autonomous Organization) voting smart contract written in Solidity.

## Overview

This contract allows users to register themselves, and once approved by the admin, they can vote on active proposals. The system tracks voting results, prevents double voting, and identifies the winning proposal(s).

## Features

- 👤 **User Roles**
  - **Admin**: Can create/deactivate proposals and change voter eligibility.
  - **Members**: Can register and vote if eligible.

- 🗳️ **Voting Logic**
  - Members can vote once per proposal.
  - Votes are only counted if the member is marked as "Eligible".
  - The system maintains a list of winning proposals with the highest vote count.

- 📦 **Events**
  - `ProposalCreated`
  - `ProposalDeactivated`
  - `UserRegistered`
  - `UserStatusChanged`
  - `Voted`

## Contract Structure

- **Enums**
  - `ProposalStatus`: `Active`, `Deactive`
  - `VotersStatus`: `NotRegistered`, `Registered`, `Eligible`, `Revoked`

- **Structs**
  - `Proposal`: Contains description, vote count, and status

- **Main Functions**
  - `registerYourself()`
  - `checkEligibility(address, VotersStatus)`
  - `createProposal(string)`
  - `voting(bool, uint256)`
  - `deactiveProposal(uint256)`
  - `winnerInfo()`

## Usage

1. **Deploy** the contract (Admin becomes `msg.sender`)
2. **Register** users via `registerYourself()`
3. **Admin** sets eligible voters using `checkEligibility(...)`
4. **Admin** creates proposals
5. **Eligible users** vote on active proposals
6. View winners using `winnerInfo()`

## Version

- Solidity `^0.8.29`

## License

This project is licensed under the MIT License.
