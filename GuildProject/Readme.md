# 🛡️ Guild Registry Smart Contract

A decentralized guild management system built with Solidity, allowing admins to register players, manage roles, and handle player progression within a guild.

## ⚙️ Features

- **Admin and Member Roles**  
  The contract distinguishes between Admins and Members using an `enum`.

- **Player Registration**  
  Only Admins can register new players as Members, assigning them a name and initializing their level.

- **Leveling Up**  
  Members can level up their characters through the `levelUp` function.

- **Leave the Guild**  
  Members can choose to leave the guild and have their data deleted.

- **Admin Management**  
  Admins can transfer admin rights to another player.

## 📜 Contract Overview

### Structs & Enums

- `enum Role { Member, Admin }`
- `struct Player { uint256 PlayerLevel; string PlayerName; Role PlayerRole }`

### State Variables

- `admin`: The current administrator's address.
- `playerInfo`: Mapping of addresses to player data.

### Modifiers

- `existenceCheck`: Ensures the caller is a registered player.
- `alreadyExist`: Ensures a player is not already registered.
- `onlyAdmin`: Restricts access to admins.
- `onlyMember`: Restricts access to members.

### Events

- `PlayerRegistered`: Emitted when a new player joins the guild.
- `PlayerLeveledUp`: Emitted when a member levels up.
- `PlayerDeleted`: Emitted when a player leaves the guild.
- `AdminChanged`: Emitted when the admin role is transferred.

### Key Functions

- `register(address _player, string memory _name)`: Admin-only; registers a new player.
- `levelUp()`: Member-only; increases the player's level.
- `leaveGuild()`: Member-only; deletes the caller's player record (except the admin).
- `changeAdmin(address _newAdmin)`: Admin-only; transfers admin rights to another player.
