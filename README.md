# What is the Helsinki puzzle?

Given an empty ![](https://latex.codecogs.com/svg.latex?N%5Ctimes%20N) grid, your job is to fill the grid with integers such that:
* Each row is unique
* Each row ![](https://latex.codecogs.com/svg.latex?H_%7Bi%2C*%7D) is equal exactly one column ![](https://latex.codecogs.com/svg.latex?H_%7B*%2Cj%7D). where ![](https://latex.codecogs.com/svg.latex?i%20%5Cneq%20j).
* If an integer ![](https://latex.codecogs.com/svg.latex?n) is present in the grid, you must also place all integers ![](https://latex.codecogs.com/svg.latex?1%20%5Cleq%20m%20%3C%20n).
* All the placed integers must not be greater than ![](https://latex.codecogs.com/svg.latex?N).

# Example

<p align="center">
  <img src="https://i.imgur.com/wucyNW0.png" width="350" alt="Helsinki">
</p>

The image above shows the solution to a ![](https://latex.codecogs.com/svg.latex?4%5Ctimes%204) helsinki puzzle. Equal rows and columns are colored in accordance with eachother. 
