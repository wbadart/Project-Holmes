# Project Holmes Security Toolbox

#####This project is a suite of tools designed around the theme of security.  The idea was concieved as a project for the second half of the Notre Dame introductory engineering class.  While the projects aim shifted thoughout the planning phase, the central idea of creating a brute force password breaker remained constant.  The list of features gradually expanded, and now includes all of the following tools:

######1. Robust password cracker
  - brute force method
  - common password attack
  - dictionary attack
  - modified dictionary attack
  
A program which can run a series of tests on a given password and return both statistics about the crack and feedback for strengthening the password.

######2. Password generator
A tool which can be used to generate passwords of various strength and length.

######3. Message Decoder
  - text file upload
  - letter remap tweaking
  
Takes text encrypted with a 1:1 letter replacement scheme (such as a caesar cypher like the one included in this repo) and decrypts it based on the number of occurences of each letter.  Works best when all letters are represented.  After inital decryption, the replacement scheme estimated by the script can be tweaked by the user until the original message is shown.

######4. Text file merging
When developing the dictionary attack, we found that one dictionary often wasn't enough to cover all the words.  We created this tool to combine dictionary text files without having duplicate entries.  The inital iteration of this program took over a day to combine two, but the published version can do it in four hours.  A spreadsheet of data on this later version is included in the repo.

Collaborators:
- Happy Hale<br />
- Rachael Mullin<br />
- Tucker Killian<br />
- Grace Bushong<br />
- Will Badart

Be sure to check for releases regularly.  That's where you can find the latest published version of the toolbox (before you download, make sure you've read the license).
