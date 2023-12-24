[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/fkiJ6Krw)
# setu-mobile-game-dev-1-2023-assignment-2

## Deadline

Deadline is December 27th, 23:59.

## The Assignment

Create a multi-level Defold game with taking the following grading rubric into consideration.

The game should target the mobile ecosystem and should contain the following facets of defold:


| Grade     | Game Design Doc   | Game Config/Setup                                                    | Defold Components                       | Game Progression                                                             | Physics                                                        |
| --------- | ----------------- | -------------------------------------------------------------------- | --------------------------------------- | ---------------------------------------------------------------------------- | -------------------------------------------------------------- |
| Starter   | Starter Detail*   | Splash Screen and simple game start                                  | Basic Use of Defold Components**        | Single Level - Completion via Time or Score                                  | One Type of Collision Object                                   |
| Basic     | Basic Detail*     | Game Welcome with Interactive Start                                  | Intermediate Use of Defold Components** | Progression Through 2 levels either via time or score                        | Collision Groups                                               |
| Good      | Good Detail*      | Game High Scores, Save and Load                                      | Good Use of Defold Components**         | Progression Through 3 levels either via time or score                        | Collision Groups and multiple types of collision objects       |
| Excellent | Excellent Detail* | Additional Config and Setup (e.g. Difficulty levels, Visual Changes) | Excellent Use of Defold Components**    | All above with Character Progression  e.g. Experience Points (XP) or rewards | Advanced usages of collision objects, groups, joints, raycasts |

Feel free to highlight where you feel you have excelled in the addition comments in the submission section below.  This assignment will be 60% of your final grade.

The game should be sprite based, have more than one sprite, and should have a tilemap.  The game should be playable on a mobile device.

# Submission

1. You must use the github classroom repository and commits should be spread over time
2. The grading rubric at the end of this README must be filled in to highlight the areas you believe you deserve marks
    1. https://www.tablesgenerator.com/markdown_tables may help
3. A video showcasing walking through the game and features must be provided, see submission area below
3. Everything must be contained in this repository
4. A Moodle submission link will be provided to upload a zip of the repository before the deadline
6. Non response to issues with submission or non response to questions will result in 10% lost for each incident
7. You may be asked to attend an interview to verify your work, the likelihood of this increases if:
    1. You are not attending lab/lectures
    2. Your labs repository is way behind
    3. You do not commit over time
    4. Suspicion of plagiarism
    5. Particularly weak submission 
8. The use of generative AI is not permitted to generate source code or documentation in this assignment (copilot, chatgpt, or otherwise, locally or hosted)
    1. Generative AI is an excellent tool but you risk not learning fundamental skills by relying on it too soon
9. Usage of any published source should be referenced and documented via comments, you may be asked to explain inner workings of such usages

* Student Number: 20080901
* Name: Darren Sills
* GitHub username: D-Sills

[Design Document](docs/design.md)

## Submission
### Self Assessment Rubric

| Grade     | Game Design Doc                                                           | Game Config/Setup                              | Defold Components                                                            | Game Progression | Physics                                             |
| --------- |---------------------------------------------------------------------------|------------------------------------------------|------------------------------------------------------------------------------| ---------------- |-----------------------------------------------------|
| Starter   | Basic description of game                                                 | Splash screen/ robust scene management         | Sprites, basic GUI, labels, tilemap                                                   |See below                  | See below                                           |
| Basic     | Deeper delving into mechanics                                             | Main menu/ level selection, easy retries                     | Manipulating of sprites, basic animations, collision objects and groups      |See below                  | See below                                           |
| Good      | Mention potential improvements, good use of markdown                      | Persistent high scores/rankings and user level | Factories, collection proxies, 3rd party libraries from defold asset browser |3 different levels, player choice. Replayable.                 | Multiple collision groups, player, pickups, enemies |
| Excellent | Clear and concise language, accurately describes the game and all systems | Volume control via slider , difficulty selection                     | ParticleFX, heavy usage of GUI and templates, lua modules                    |Overarching account level, increases depending on success | Had no need for advanced physics                    |

### Additional Comments and Highlights

I guess first things first, this is definitely not what you expected. Maybe not the best choice of project since I couldn't really implement more advanced phsyics or
tilemaps(in a meaningful way), but I think the final result was pretty good. It would be easy enough to add more levels and songs, and I think the game is pretty fun to play. 
It could definetly use some polish, but time is tight at the moment as I'm sure you understand. Better level designs, improved feedback and visual effects would go a long way. The UI is also an eye sore big time.

All in all, I'm pretty happy with how it turned out. I think I did a good job of using the Defold engine, especially the messaging and GUI, and I learned a lot about the engine itself,
and lua in general. While I'm not sure if I'll be using Defold in the future, I'm glad I got the chance to learn it.

I used FMOD for the audio, which is a 3rd party library and very powerful audio solution. I'm actually using it in my final year project, so I thought it would be a good idea to get some practice with it.
I was pleasantly surprised by the Defold integration, which was done entirely by the community., open source. It worked more or less seamlessly.
### Video Link

Game Explanation and Walkthrough Video Link: