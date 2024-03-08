# Shinami SDK

[![pub package](https://img.shields.io/pub/v/sui_shinami.svg?label=sui_shinami&color=blue)](https://pub.dartlang.org/packages/sui_shinami)

This package is developed for integration Shinami SDK for Sui.
We can easily use own sponsored wallet for user's transactions to give a smoothly experience.

> Now support by **PassionLab**.

## Features
---

- [x] Shinami Gas Station

## Installation
---

```
dependencies:
  sui_shinami: ^1.0.0
```

## Demo
---

Waiting...

## Usage
---

Use **TransactionBlock** to execute your transaction with `prefixTransaction` parameter.

```dart

final response = await _gasStation.executeTransaction(
  senderAccount: ...,
  prefixTransaction: ...,
);

```

### Normal Transaction

```dart
const movePackageAddress =
    '0xfa0e78030bd16672174c2d6cc4cd5d1d1423d03c28a74909b2a148eda8bcca16';
const movePackageModule = 'clock';
const movePackageMethod = 'access';

final suiAccount = SuiAccount.ed25519Account()

final response = await _gasStation.executeTransaction(
  senderAccount: suiAccount,
  prefixTransaction: (TransactionBlock transactionBlock) async {
    return transactionBlock.moveCall(
      '$movePackageAddress::$movePackageModule::$movePackageMethod',
      arguments: [
        transactionBlock.object('0x6'),
      ],
    );
  },
);
```

### Transfer Transaction

```dart
response = await _gasStation.executeTransaction(
  senderAccount: mySuiAccount,
  prefixTransaction: (TransactionBlock transactionBlock) async {
    return transactionBlock.transferObjects(
      [
        transactionBlock.objectId("<object id>"),
      ],
      transactionBlock.pureAddress(recipientSuiAddress),
    );
  },
);
```

## Contributing

---

Welcome the talents to contribute. Let's make this plugin stronger!

- Implement new features and submit a pull-request any time
