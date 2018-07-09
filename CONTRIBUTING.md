# Contributing

A large open source website is a difficult thing to manage. This document will
explain much of the process that we will use while the site is still private.
As it develops, we'll also look to see how we can transition from private to
public. Please file an issue with suggestions!

**tl;dr: Always file an issue first, unless you are updating dependencies.**

## Design

Design is a complicated thing, and many folks have lots of polarizing feels about it.
For the moment, large design changes are made exclusively by @ashleygwilliams and 
@aturon. If you have concerns or thoughts for small changes, please file an issue so 
that we can discuss it first!

## Development

Currently, @lbaillie and @ashleygwilliams are the primary developers on the site. If
you need help or have any questions please direct them to @ashleygwilliams.

Before filing a PR to the site, please file an issue. This way we can ensure that the
work you are doing meets the requirements of the site and will be very likely merged.
If you file a PR before an issue, you will likely be asked to file an issue, or your
PR may be closed outright.

### Updating Dependencies and Rust Version

The only exception to this rule is updating the site's dependencies and Rust version.
Because the site uses the Rocket framework, and is therefore dependent on nightly, it is
often the case that dependencies and the Rust version must be updated to get the site to
run at all. Because NOT updating the dependencies and Rust version can block development
of content, please feel free to open a PR with dependency updates whenever you find it
is required and we will merge it right away.

## Content

For the time being, there are assigned content owners for each page of the website.
Those content owners represent the teams and working groups who are the primary
contirbutors to the content for each page.

Content representatives are in charge of:
- Content (headers, taglines, paragraphs, embedded content such as videos)
- General Layout and Design: give an idea of how things should be presented,
  what images or icons you would like to use

Content representatives do not need to worry about:
- CSS (to whatever extent you'd like to give vision and not code, that's acceptable)
- Image creation (give an idea of what you'd like, but you don't need to make/find it)

Content representatives should file PRs that add content and minimal markup to the
codebase. For design and image concerns, please file issues with sketches and 
explanation so that our artists, designers, and coders can fulfill your request.

Your content PR will go through 3 stages:
  - ### Drafting Stage
    In this stage, do your best to get a general sense of the page layout and content.
    Links should be complete, and headers and copy should be present, but it's ok if
    the content is not 100% refined. You should have issues filed for any image assets
    you will need created, and you should have an issue filed with a general sketch of
    the layout you would like to have CSS written for. 
    You will work with @ashleygwilliams on this stage.
  - ### Polishing Stage
    After passing the drafting stage, you will work with @aturon to refine the content
    of your page. This will likely involve lots of wording changes, and ideally, minimal
    updates to layout and design. 
    Once you pass this stage, your PR will be accepted and merged into the site.
  - ### Review Stage
    This is the final stage, where you will work with several representatives from your
    team and @aturon to ensure that everyone is pleased, if not excited!, about the page.

### Content Owners

If you have a question or would like to work on content in an area, please be sure
to at-mention the content owner for that category. If you are not sure what category
your idea fits in, please at-mention @ashleygwilliams.

- Tools, @nrc
- WASM, @sendilkumarn
- CLI, @spacekookie + @killercup
- Embedded, @japaric + @jamesmunns
- Net, @aturon
- Docs + Learn, @QuietMisdreavus + @steveklabnik
- Governance, @aturon
- Community, @skade + @ashleygwilliams
- Release/Download, @ashleygwilliams
