# Contributing

A large open source website is a difficult thing to manage. This document will
explain much of the process that we will use while the site is still private.
As it develops, we'll also look to see how we can transition from private to
public. Please file an issue with suggestions!

**tl;dr: Always file an issue first.**

**Contacts:** [@ashleygwilliams], [@aturon], [@chriskrycho], [@yoshuawuyts]

[@ashleygwilliams]: https://github.com/ashleygwilliams
[@aturon]: https://github.com/aturon
[@chriskrycho]: https://github.com/chriskrycho
[@yoshuawuyts]: https://github.com/yoshuawuyts

## Design and Content

Design and content are complicated thing, and many folks have lots of polarizing
feels about it. For the moment, large design changes are made exclusively by the
team (listed above). If you have concerns or thoughts for small changes, please
file an issue so that we can discuss it first!

### Design

The site currently uses two frameworks: [Tachyons] and [Skeleton].

The team is currently in the process of transitioning from Skeleton to Tachyons.
This is a somewhat complicated transition, so if you would like to update CSS,
please file an issue.

[@yoshuawuyts] and [@chriskrycho] are the current developers on this transition. Please
direct issues and questions to them!

[Tachyons]: http://tachyons.io/
[Skeleton]: http://getskeleton.com/

### Content

The content of the site is currently overseen by [@aturon]. Please direct issues
and questions to him.

The content is largely owned by the associated team or working group. If you have
thoughts, it can be useful to discuss those with the lead(s) of those groups. You
can learn more about the teams and working groups on the Governance page of the
site.

If you would like your company to be displayed on the 'Production' page
(i.e. would like to edit `src/data/users.yml`), you should
e-mail production@rust-lang.org (please do *not* raise a PR) with:

 - Your company name, URL and logo.
 - A one short sentence describing your usage of Rust, ideally with a link
   providing evidence (other prospective users will be interested to
   know details). The UI for this can't accommodate more than about two
   lines of text
 - A name and e-mail of a contact within your organization who the
   Rust team can contact should we need to make changes to the web
   page. This information will be kept private.

Logos will be displayed against a white background and constrained
via CSS to a width of 200px by 100px. To support high-resolution
displays, consider submitting your image at a resolution of at least
400px by 200px.

## Development

Currently, [@ashleygwilliams] is the primary developer on the site. If
you need help or have any questions please direct them to [@ashleygwilliams].

Before filing a PR to the site, please file an issue. This way we can ensure that the
work you are doing meets the requirements of the site and will be very likely merged.
If you file a PR before an issue, you will likely be asked to file an issue, or your
PR may be closed outright.
