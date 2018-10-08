# Lab 1 - *Tumbly*

![](https://github.com/Aaivazi000/Tumbly/blob/master/Tumbly_small.jpg)

**Tumbly** is a photo browsing app using the [The Tumblr API](https://www.tumblr.com/docs/en/api/v2#posts).

Time spent: **6** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User can scroll through a feed of images returned from the Tumblr API (5pts)

The following **stretch** user stories are implemented:

- [x] User sees an alert when there's a networking error (+1pt)
- [ ] While poster is being fetched, user see's a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [ ] Customize the selection effect of the cell (+1pt)

The following **additional** user stories are implemented:

- [x] Tumbly also fetches the summaries of each post and places the first 2 lines in a label below the image. The pupose of this feature is to give the users some context to the image they are viewing. (+1-3pts)
- [x] Not sure if this counts as a user story but I designed my own app logo (image at top of readme) and matching Launch screen.
  - Matching Launch Screen
    - ![](https://github.com/Aaivazi000/Tumbly/blob/master/Tumbly%20Launch_small.png)


Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to implement the pull to refresh so the tableview does not move behind the refresh symbol while it is refreshing.
2. Placing a title at the top of the ViewController without having to add a Navigation controller.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

#### Tumbly Walkthrough with Network Connection
<img src='https://i.imgur.com/ILishV7.gif' />

The gif may not load due to length restrictions. [Here is a link to post on imgur](https://imgur.com/ILishV7)

#### Tumbly Walkthrough without Network Connection
<img src='https://i.imgur.com/NiKjzLI.gif' />


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

* I cannot seem to place the refresh control in a way where the table view does not interfere. After refreshing the tableview will come back to the top of the UI and move behind the refresh control.

## License

Copyright [2018] [Andriana Aivazians]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Lab 2 - *Tumbly*

**Tumbly** is a photo browsing app app using the [The Tumblr API](https://www.tumblr.com/docs/en/api/v2#posts).

Time spent: **2** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User can tab an image to view a larger image in a detail view (5pts)

The following **stretch** user stories are implemented:

- No stretch stories implemented.

The following **additional** user stories are implemented:

- [x] User can see the caption of the photo in the detail view. The caption also shows where the photo was taken (at the end). The purpose of this feature is to build upon the use of the summary text shown in each photo in the tableview. On the home screen the user may read the summary and take further interest in the photo. Then the user will click on the cell to learn more about the photo in the detail view. Once in the detail view the user can read the full story of the photo.

Please list areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to use gesture recognizers in view controllers 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/qa2hisg.gif' />

If the gif does not load due to length restictions you can click on [this link](https://imgur.com/qa2hisg) to view the walkthrough.

## Notes

In every caption there is some HTML text that I could not remove using the replaceOccurances method because the text changed based on the caption. I believe this can be handled using string parsing, however I do not know how parsing is done in Swift.

## License

    Copyright [2018] [Andriana Aivazians]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
