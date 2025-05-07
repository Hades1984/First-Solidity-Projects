# QuestBoard Smart Contract

**QuestBoard** is a decentralized application (dApp) that allows users to create quests, claim them, and receive rewards once completed. This smart contract is built using Solidity and deployed on the Ethereum blockchain.

## Features

- **Create Quests**: Users can create quests with descriptions and rewards.
- **Claim Quests**: Anyone (except the creator) can claim a quest and try to complete it.
- **Complete Quests**: Quest creators can mark a quest as completed.
- **Claim Rewards**: Once a quest is completed and verified, the person who claimed the quest can receive the reward.

## Smart Contract Functions

### `createQuest`
Creates a new quest with a description and a reward. The quest is initialized with the creator’s address and marked as incomplete.

**Parameters:**
- `_Description` (string): The description of the quest.
- `_Reward` (uint256): The reward for completing the quest (in wei).

### `claimQuest`
Allows a user to claim a quest. Only one person can claim the quest at a time, and the creator cannot claim their own quest.

**Parameters:**
- `_questid` (uint256): The ID of the quest to be claimed.

### `checkCompleted`
Allows the creator of a quest to confirm if the quest has been completed by the person who claimed it.

**Parameters:**
- `_completed` (bool): Set to `true` if the quest is completed, otherwise `false`.
- `_questid` (uint256): The ID of the quest to be confirmed.

### `saveReward`
Allows the user who claimed the quest to claim their reward, but only if the quest has been marked as completed by the creator.

**Parameters:**
- `_questid` (uint256): The ID of the quest to claim the reward from.

## Events

- `QuestCreated`: Triggered when a new quest is created.
- `QuestClaimed`: Triggered when a quest is claimed by a user.
- `QuestCompleted`: Triggered when a quest is marked as completed and the reward is claimed.

## Example Workflow

1. **Create a Quest**: The creator of a quest deploys the smart contract and calls `createQuest` to set the quest description and reward.
   
2. **Claim a Quest**: A user calls `claimQuest` to accept the quest and start working on it.

3. **Complete the Quest**: The creator verifies the completion of the quest using `checkCompleted`.

4. **Claim the Reward**: Once the quest is completed and verified, the user who claimed the quest can call `saveReward` to receive their reward.
5. 

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
