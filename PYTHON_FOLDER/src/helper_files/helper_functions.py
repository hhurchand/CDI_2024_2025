import numpy as np

def sum_list(my_list):
    return np.sum(my_list)

def average_list(my_list):
    return np.mean(my_list)

def Max_Min_list(my_list):
    return "The maximum is " +  str (np.max([my_list])) + " and the minimum is " + str (np.min(my_list))


