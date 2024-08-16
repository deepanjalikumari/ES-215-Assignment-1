import matplotlib.pyplot as plt

N_values = [64, 128, 256, 512, 1024]
c_int_times = [0.000281, 0.001473, 0.014522, 0.143878, 1.257408]
c_double_times = [0.000205, 0.001936, 0.027658, 0.135427, 1.226302]  
python_int_times = [0.000427, 0.003614, 0.065339, 0.563275, 4.833976]  
python_double_times = [0.000149, 0.004894, 0.004805, 0.010624, 0.079696]  

plt.figure(figsize=(12, 6))
plt.plot(N_values, c_int_times, 'o-', label='C++ int')
plt.plot(N_values, c_double_times, 'o-', label='C++ double')
plt.plot(N_values, python_int_times, 's-', label='Python int')
plt.plot(N_values, python_double_times, 's-', label='Python double')
plt.xlabel('Matrix Size N')
plt.ylabel('Execution Time (seconds)')
plt.title('Matrix Multiplication Times')
plt.legend()
plt.grid(True)
plt.show()
