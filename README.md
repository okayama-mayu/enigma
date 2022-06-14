# Mod 1 Project 4 Enigma
## Self-Evaluation

Based on the [provided rubric](https://backend.turing.edu/module1/projects/enigma/rubric), I would give myself the follow assessment:  

#### Functionality: 3.5
Although I was able to create 2 versions of a method that cracks a code and passes the spec tests, one version (`lib/old/enigma_crack.rb`) was unable to replicate the results in CLI and the second version (`lib/enigma_crack_v3.rb`) was only able to replicate the results in CLI at times, while the runtime was too long at other times for it to be practical. Encrypt and decrypt were successfully implemented in CLI and tested.

#### Object Oriented Programming: 4
I have implemented inheritance and a module. I have a superclass, Enigma, which holds the attributes when Encrypt, Decrypt, or Crack are initialized, as well as shared methods that allow the three child classes to serve their function. I chose to break out the three child classes because I wanted each to have their own function. The module Decryptable was created as Decrypt and Crack shared a method that allowed them to decrypt a message, although Decrypt has a key and date given to it or auto-generated, while Crack needs to find the key given the date and ciphertext. I chose to implement a module rather than placing the shared method in the superclass because the method is not shared by the Encrypt class, and I wanted to keep the Enigma class free of any methods that are not shared by all three child classes.

#### Ruby Conventions and Mechanics: 3.5
To the best of my knowledge, I believe the classes, methods, and variables are well-named and formatted correctly. Excluding comments, none of my methods are more than 10 lines long, and believe my enumerables and data structures are the most efficient tool for a given job. However, given the run time on my Crack class, I do not think I fulfill this requirement at the highest level.

#### Test Driven Development: 3.5
My test coverage metrics according to SimpleCov are at 100%. However, I was not able to implement mocks or stubs in an effective manner, although I did successuflly implement one test in the `enigma_spec.rb` file and attempted to replicate CLI user inputs in `enigma_encrypt_spec.rb` (see commented out test at line 95).

#### Version Control: 3
Due to an error in creating the GitHub repository, my commits for Encrypt and Decrypt were chunked together and pushed to main instead of as a branch/pull request. However, I do have 6 branches with 5 merges and 43 commits as of the time of writing. I was not as consistent with my commits as I should have been, and they include multiple pieces of functionality. 
