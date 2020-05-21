# Translation Guidelines

The Rust website can be translated into multiple languages using [fluent](https://github.com/projectfluent) and on our own [pontoon instance](https://pontoon.rust-lang.org). Note that these features are currently in development.

## What can be translated

All text on the website can be translated. Some texts, especially policies, can be translated, but the English version will be the binding one.

## Existing translation teams

- [`de`](https://rust-lang.zulipchat.com/#narrow/stream/231802-t-community.2Fl10n.2Fde)
- [`es`](https://rust-lang.zulipchat.com/#narrow/stream/226069-t-community.2Fl10n.2Fes)
- [`fa`](https://rust-lang.zulipchat.com/#narrow/stream/231801-t-community.2Fl10n.2Ffa)
- [`fr`](https://rust-lang.zulipchat.com/#narrow/stream/226175-t-community.2Fl10n.2Ffr)
- [`it`](https://rust-lang.zulipchat.com/#narrow/stream/226070-t-community.2Fl10n.2Fit)
- [`ja`](https://rust-lang.zulipchat.com/#narrow/stream/226071-t-community.2Fl10n.2Fja)
- [`pl`](https://rust-lang.zulipchat.com/#narrow/stream/226319-t-community.2Fl10n.2Fpl)
- [`pt`](https://rust-lang.zulipchat.com/#narrow/stream/226072-t-community.2Fl10n.2Fpt)
- [`ru`](https://rust-lang.zulipchat.com/#narrow/stream/226073-t-community.2Fl10n.2Fru)
- [`tr`](https://rust-lang.zulipchat.com/#narrow/stream/226074-t-community.2Fl10n.2Ftr)
- [`zh`](https://rust-lang.zulipchat.com/#narrow/stream/226075-t-community.2Fl10n.2Fzh)

## Forming a translation team

Translation teams for any language need at least _three_ members. This is to avoid translations to "drop out" of support too quickly. If you feel like having a team, please get in touch with the [localization team][zulip] ([email][zemail]) to apply for a translation. Have all team members register at the [pontoon](https://pontoon.rust-lang.org) and send us their email addresses. We'll make sure to get you set up as managers. Managers can manage their translation teams through the "permission" tab in the web interface, including appointing new managers.

Please note that as a manager, you work on the representation of the Rust project in your locale. Make sure to understand and act with that responsibility and only promote well-trusted people to a manager role.

Teams ideally consist only of native speakers. Even within one language it can be useful to have editors from multiple backgrounds, to find a consistent language. For translators, strong writing skills matter. For reviewing, a keen eye and a good feeling for oddities is important.

Any language that can muster a constantly working and up to date translation is qualified.

[zulip]: https://rust-lang.zulipchat.com/#narrow/stream/226068-t-community.2Fl10n
[zemail]: mailto:localization@rust-lang.org

## How to get your translation published

You will have 2 weeks time for an initial translation of the page, after which we will start to check up on you. Please note the section on policies below.

If you finished your task and all members of the team agree that the translation is done, it will go to trial for another two weeks. In this time, we encourage people to read the translation and give feedback.

After this time, we evaluate the state of the translation with the goal to make it permanent. A permanent translation will be kept as long as changes are made within a reasonable time frame of them main language changing. Should a language drop out of support, we will make one attempt at getting in touch with the team and finding new members, then it will be removed.

## How to translate

Anyone can give suggestions to a translation by signing up to the pontoon instance and using the "suggest" function. Managers and Translators can review.

Translations are done via keys: for example, a key name `rust-claim` in the website source will expand to "A language empowering everyone..." in the English translation. Translations will override this key with their own phrase. Some translations use [_variables_](https://projectfluent.org/fluent/guide/variables.html) to interpolate other text. For example, some string may say `rls-text = Read more about RLS <a href="{ $href }">here</a>`, in which case the website is setting the `$href` variable to the actual link. Be sure to include this in the translation as well. This is typically used to interpolate links, complex HTML, and code blocks. Furthermore, some things like security emails and keys are included using [_terms_](https://projectfluent.org/fluent/guide/terms.html), which look like variables but start with a `-`. The protocol is the same here, make sure the term is included in the translation.

Each translation must be reviewed by a second member of the team for quality control. Follow this workflow:

### Suggesting a translation

* Log in on [pontoon](https://pontoon.rust-lang.org)
* Navigate to the language you want to translate
* Navigate to the project you want to translate
* Pick one of the files
* Find an untranslated key or the one you want to change
  * You can use the filter "Untranslated" for quickly finding new ones
* Click the gear icon and make sure to check "make suggestions"
  * The button should clearly read "suggest"
  * This is very important for project managers, as they can work without
* Translate the key at hand and hit suggest for as long as you want

### Reviewing translations

* Log in on [pontoon](https://pontoon.rust-lang.org)
* Navigate to the language you want to review
* Navigate to the project you want to review
* Find an unreviewed key
  * You can use the filter "Unreviewed" for quickly finding them
* Navigate to "HISTORY"
  * You see the proposed suggestions. Check the checkmark to accept one, or the cross to refuse.
* You may add a better suggestions, which others can in turn review

### Locally testing translations                                         

It can be useful to locally preview the translation to evaluate if the layout breaks (example with different graphemes).                             

In order to check the changes, you need:

* Clone the website code repository

* [Run the website locally](https://github.com/rust-lang/www.rust-lang.org#running-the-app-locally)

* Download from Pontoon the translation you're currently working on

![2020-01-18_00-01-1579304647](https://user-images.githubusercontent.com/6098822/72654165-a2577000-398e-11ea-96f0-d44c5111d754.jpg)

* Copy the downloaded file into `locales/<lang>` of your local copy of the website

* Make sure your language is in the `EXPLICIT_LOCALE_INFO` array in `src/i18n.rs`

* Restart the website locally everytime you change a local file

## Special case: Policies

All policy documents outside other than English must contain a link to the original on top, indicating that the English translation is binding and the translation is a best effort.

Also, a translation team can decide to leave any policies untranslated, instead opting for just linking to the English translation with an appropriate wording.
