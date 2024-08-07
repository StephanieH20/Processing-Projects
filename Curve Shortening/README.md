From 2022, after hearing about Grigori Perelman's infamous solution to the Poincare Conjecture. His proof used something called Ricci Flow. This project provides a simple illustration in 2D, in which this could simply be referred to as curve-shortening flow: https://en.wikipedia.org/wiki/Curve-shortening_flow#.
The algorithm essentially "smooths" out a closed curve by incrementally minimizing curvature around the curve, shrinking it down into a circle and then a point. 

Note: the curve-shortening algorithm I used here is technically different from the "canonical" curve-shortening flow, which depends on curvature. The version illustrated here is a more naive version; each point on the discrete curve moves towards the average of its two neighbors. 

Draw a closed curve then press space to start curve shortening. You can also pause and resume the process by pressing space.

https://user-images.githubusercontent.com/30028111/218723139-79e34ab8-acc6-4b28-abf6-20e03544f8b6.mov
