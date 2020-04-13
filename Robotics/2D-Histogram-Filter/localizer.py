import pdb
from helpers import normalize, blur

def initialize_beliefs(grid):
    height = len(grid)
    width = len(grid[0])
    area = height * width
    belief_per_cell = 1.0 / area
    beliefs = []
    for i in range(height):
        row = []
        for j in range(width):
            row.append(belief_per_cell)
        beliefs.append(row)
    return beliefs

def sense(color, grid, beliefs, p_hit, p_miss):
    new_beliefs = []
    
    ###
    ###    TODO: Write your code below
    ###
    
    # Construction of new_beliefs
    for r, row in enumerate(beliefs):
        new_row = []
        for c, belief in enumerate(row):
            new_belief = belief * (p_hit if grid[r][c] == color else p_miss)
            new_row.append(new_belief)
        new_beliefs.append(new_row)
    
    
    
    # Normalization
    s = 0
    for row in new_beliefs:
        for belief in row:
            s += belief  
    for r in range(len(new_beliefs)):
        for c in range(len(new_beliefs[0])):
            new_beliefs[r][c] /= s

    return new_beliefs

def move(dy, dx, beliefs, blurring):
    height = len(beliefs)
    width = len(beliefs[0])
    new_G = [[0.0 for i in range(width)] for j in range(height)]
    for i, row in enumerate(beliefs):
        for j, cell in enumerate(row):
            new_i = (i + dy ) % height    # the problem was here. It was being modulo'ed with width instead of height
            new_j = (j + dx ) % width    # the problem was here. It was being modulo'ed with height instead of width
            # pdb.set_trace()
            new_G[int(new_i)][int(new_j)] = cell
    return blur(new_G, blurring)