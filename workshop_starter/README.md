# Kudo Flutter Workshop @Kabisa

In this repo you'll find a [starter project](./) and the [full finished app](../final_app).
For this workshop we'll start out with the starter app, but feel free to take a peek at the final app too.

To get going clone this repo and open the `workshop_starter` project in your editor of choice.

```
$ git clone git@github.com:kabisa/flutter-workshop.git
$ cd flutter-workshop/workshop_starter
```

## Step 1: Kudo Card

Our Product Owner sent you the following task

> As a user, I want to see a Kudo transaction, so that I display Kudos given and received

The designer sent you a mockup

![Kudo Transaction](../_mockups/kudo-card.png "Kudo Transaction")

---

Together with the team, you discussed, that you will need the following Flutter widgets:

* [Card](https://api.flutter.dev/flutter/material/Card-class.html)
* [Circle Avatar](https://api.flutter.dev/flutter/material/CircleAvatar-class.html),
  [NetworkImage](https://api.flutter.dev/flutter/painting/NetworkImage-class.html)
* [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)
* [Container](https://api.flutter.dev/flutter/widgets/Container-class.html),
  [Row](https://api.flutter.dev/flutter/widgets/Row-class.html),
  [Column](https://api.flutter.dev/flutter/widgets/Column-class.html),
  [Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html),

You can implement the Kudo transaction card in [./lib/widgets/transaction_widget.dart](./lib/widgets/transaction_widget.dart).

<details>
  <summary>Solution</summary>

  * [Transaction Widget](../final_app/lib/widgets/transaction_widget.dart)
</details>

---

# Step 2: Kudo Feed

You return victorious from your journey in implementing the Kudo Transaction Card.

Soon the Product Owner comes the room in with a(nother) great idea

> As a user, I want to see a Kudo transaction feed, so that I see a list of Kudos given.

The whole thing should look like that

![Kudo Transactions Feed](../_mockups/kudo-feed.png "Kudo Transactions Feed")

To ship that feature, you will only need this flutter widget

* [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)

But that is not the only thing you will need...

A Co-worker appears from behind the desk, and shows you the following dart class

* Kudo [Transactions](./lib/data/transactions.dart) Class

You see that the property `dummyTransactions` is a public property, and you can do

```
Transactions.dummyTransactions
```

to retrieve the dummy data.

You can start implementing the ListView in [lib/screens/home_screen.dart](./lib/screens/home_screen.dart).

<details>
  <summary>Solution</summary>

  * [Transaction List](../final_app/lib/widgets/transaction_list.dart)
</details>

<details>
  <summary>If you're feeling adventurous</summary>

  You can also implement a Grid to Transactions in a grid (nice for desktop!).
  Use the Flutter [GridView](https://api.flutter.dev/flutter/widgets/GridView-class.html).

  [Transaction Grid in final app](../final_app/lib/widgets/transaction_grid.dart)
</details>

## Step 3: Kudo Form

Great, we can show a Kudo transaction and display them in a list.

What would be an app without a form, so we come to our final user story

> As a user, I want to create a Kudo transaction form, so that I can enter new Kudo transactions.

The mockups show what we need to build

![Kudo Form](../_mockups/kudo-form.png "Kudo From")
![Kudo Form Keyboard](../_mockups/kudo-form-keyboard.png "Kudo From")

Based on the mockup we will need the following flutter widgets

* [Form](https://api.flutter.dev/flutter/widgets/Form-class.html)
* [FormValidators](https://api.flutter.dev/flutter/widgets/FormFieldValidator.html)
* [TextFormField](https://api.flutter.dev/flutter/material/TextFormField-class.html)
* [TextInputFormatter](https://api.flutter.dev/flutter/services/TextInputFormatter-class.html)
* [InputDecoraction](https://api.flutter.dev/flutter/material/InputDecoration-class.html)

You can start implementing the Kudo Form in [lib/screens/new_transaction_screen.dart](./lib/screens/new_transaction_screen.dart).

<div style="background-color: #e7f8ff; color: #000; padding: 1em; margin-bottom: 1em;">ℹ️ <strong>Note:</strong> You don't have to implement _storing_ the new Transaction yet. If the form can be validated and submitting the form closes the page, you're done!</div>

<details>
  <summary>Solution</summary>

  * [New Transaction Screen](../final_app/lib/screens/new_transaction_screen.dart)
</details>

# Step 4: Adding State management and showing the Kudo Submitted Transaction with snackbar

* [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) To display a snackbar or a persistent bottom sheet
* [Scaffold.of(context)](https://api.flutter.dev/flutter/material/Scaffold/of.html) to talk with the snackbar
* [Provider](https://pub.dev/packages/provider) Package for Provider and Consumer of Transactions
* [ChangeNotifier](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html)

<details>
  <summary>Solution</summary>

  * ChangeNotifier [main.dart](../final_app/lib/main.dart), [lib/data/transactions.dart](../final_app/lib/screens/new_transaction_screen.dart)
  * Consumer [lib/screens/home_screen.dart](../final_app/lib/screens/home_screen.dart), [lib/screens/new_transaction_screen.dart](../final_app/lib/screens/new_transaction_screen.dart)
</details>
