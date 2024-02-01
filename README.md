# Nice Bender Robot 

This GIT repository contains the final project of the Implementation of Computational Methods course (group 570)

In the realm of Industry 4.0, automation and robotics are increasingly pivotal, particularly in intelligent manufacturing and the emergence of smart factories. Within this context, the mechanical industry has begun to embrace these technologies at a rapid pace, driven by swift technological evolution and a growing demand for efficiently produced, high-quality products. A critical component in this advancement is the use of robots, thereby highlighting the significance of robot programming languages.
The challenge addressed in this project is the development and implementation of a compiler for a robot programming language, specifically designed to simulate the CPU of an automotive robot. This project aims to provide students with hands-on experience in creating a programming language and its corresponding compiler, focusing on the following features and constraints:

* Specific Programming Language: The language should be designed for controlling a robot operating in a factory environment. It must be intuitive and user-friendly, while also maintaining a courteous tone, thus reflecting a new trend in approachable and accessible programming.

* Limited Instructions: The language will support only two types of instructions: MOV (to move the robot) and TURN (to rotate the robot at angles of 90, 180, 270, or 360 degrees). This simplicity is intended to foster creativity in problem-solving within a restricted framework.

## Definition of CFG and Lex tokens definitions 

CFG

```
* PROGRAM → PROGRAM SENTENCE
SENTENCE → ROBOT MAGIC_WORD PREDICATE
PREDICATE → VERBS | VERBS CONJUCTION_USE
VERBS → MOVING_ACTION | TURNING_ACTIONS
CONJUNCTION_USE → CONJUCTION PREDICATE
MOVING_ACTIONS → MOVE NO_BLOCKS BLOCKS DIRECTION
TURNING_ACTIONS → TURN NO_DEGREES DEGREES
ROBOT → Robot
MAGIC_WORD → porfi
MOVE → move
TURN → turn
NO_DEGREES → 90|180|270|360
NO_BLOCKS → [0-9]+
BLOCKS → block | blocks
DEGREES → degree | degrees
CONJUNCTION → and | and then | then
DIRECTION → ahead

```

Lex tokens definitions 

```

Terminal        Regular Expression
ROBOT           "Robot"
MAGIC_WORD      "porfi"
MOVE            "move"
TURN            "turn"
DEGREES         "degree"|"degrees"
NO_DEGREES      "90"|"180"|"270"|"360"
NO_BLOCKS       [0-9]+
BLOCKS          "block"|"blocks"
CONJUNCTION     "and"|"and then"|"then"
DIRECTION       "ahead"

```

