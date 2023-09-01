% Load accelerometer data for Node 3 in X direction
load('x-dir-Node3.mat');
x_node3_time = x;
y_node3_xdir = y;

% Load accelerometer data for Node 4 in X direction
load('x-dir-Node4.mat');
x_node4_time = x;
y_node4_xdir = y;

% Load accelerometer data for Node 3 in Y direction
load('y-dir-Node3.mat');
y_node3_time = x;
y_node3_ydir = y;

% Load accelerometer data for Node 4 in Y direction
load('y-dir-Node4.mat');
y_node4_time = x;
y_node4_ydir = y;

%-----------Time domain analysis--------------------

%Time domain analysis of Node 3 in x axis
figure;
subplot(2, 1, 1);
plot(x_node3_time,y_node3_xdir);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Time Domain Acceleration Data Node3 in - X Direction');

%Time domain analysis of Node 3 in y axis
subplot(2, 1, 2);
plot(y_node3_time,y_node3_ydir);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Time Domain Acceleration Data Node3 in - Y Direction');

%Time domain analysis of Node 4 in x axis
figure;
subplot(2, 1, 1);
plot(x_node4_time,y_node4_xdir);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Time Domain Acceleration Data Node4 in - X Direction');

%Time domain analysis of Node 4 in y axis
subplot(2, 1, 2);
plot(y_node4_time,y_node4_ydir);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Time Domain Acceleration Data Node4 in - Y Direction');

%-----------frequency domain analysis--------------------

%Fast Fourier Transform (FFT) for Node 3 in x-direction

y_node3_xdir_fft = fft(y_node3_xdir);
Fs = 1 / (x_node3_time(2) - x_node3_time(1)); % Sampling frequency
L = length(y_node3_xdir); % Length of signal
frequencies = Fs * (0:(L/2))/L; % Frequency axis
figure;
subplot(2, 1, 1);
plot(frequencies, 2/L * abs(y_node3_xdir_fft(1:L/2+1)));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Domain Analysis Node3 in - X Direction');

% Fast Fourier Transform (FFT) for Node 3 in Y-direction

y_node3_ydir_fft = fft(y_node3_ydir);

subplot(2, 1, 2);
plot(frequencies, 2/L * abs(y_node3_ydir_fft(1:L/2+1)));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Domain Analysis Node3 in - Y Direction');

% Fast Fourier Transform (FFT) for Node 4 in X-direction

y_node4_xdir_fft = fft(y_node4_xdir);
Fs = 1 / (x_node4_time(2) - x_node4_time(1)); % Sampling frequency
L = length(y_node4_xdir); % Length of signal
frequencies = Fs * (0:(L/2))/L; % Frequency axis
figure;
subplot(2, 1, 1);
plot(frequencies, 2/L * abs(y_node4_xdir_fft(1:L/2+1)));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Domain Analysis Node4 in - X Direction');

% Fast Fourier Transform (FFT) for Node 4 in Y-direction

y_node4_ydir_fft = fft(y_node4_ydir);
subplot(2, 1, 2);
plot(frequencies, 2/L * abs(y_node4_ydir_fft(1:L/2+1)));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Domain Analysis Node4 in - Y Direction');

%-----------Estimating the first two natural frequencies--------------------

% Estimating the first two natural frequencies for Node3 in X-direction
y_node3_xdir_fft_abs = abs(y_node3_xdir_fft(1:L/2+1));
[~, sorted_indices] = sort(y_node3_xdir_fft_abs, 'descend');
first_natural_frequency_hz_node3_xdir = frequencies(sorted_indices(1));
second_natural_frequency_hz_node3_xdir = frequencies(sorted_indices(2));

% Estimating the first two natural frequencies for Node3 in Y-direction
y_node3_ydir_fft_abs = abs(y_node3_ydir_fft(1:L/2+1));
[~, sorted_indices] = sort(y_node3_ydir_fft_abs, 'descend');
first_natural_frequency_hz_node3_ydir = frequencies(sorted_indices(1));
second_natural_frequency_hz_node3_ydir = frequencies(sorted_indices(2));

% Estimating the first two natural frequencies for Node4 in X-direction
y_node4_xdir_fft_abs = abs(y_node4_xdir_fft(1:L/2+1));
[~, sorted_indices] = sort(y_node4_xdir_fft_abs, 'descend');
first_natural_frequency_hz_node4_xdir = frequencies(sorted_indices(1));
second_natural_frequency_hz_node4_xdir = frequencies(sorted_indices(2));

% Estimating the first two natural frequencies for Node4 in Y-direction
y_node4_ydir_fft_abs = abs(y_node4_ydir_fft(1:L/2+1));
[~, sorted_indices] = sort(y_node4_ydir_fft_abs, 'descend');
first_natural_frequency_hz_node4_ydir = frequencies(sorted_indices(1));
second_natural_frequency_hz_node4_ydir = frequencies(sorted_indices(2));

% Display the estimated natural frequencies
fprintf('Node3 in X-direction - First Natural Frequency: %.2f Hz\n', first_natural_frequency_hz_node3_xdir);
fprintf('Node3 in X-direction - Second Natural Frequency: %.2f Hz\n', second_natural_frequency_hz_node3_xdir);
fprintf('Node3 in Y-direction - First Natural Frequency: %.2f Hz\n', first_natural_frequency_hz_node3_ydir);
fprintf('Node3 in Y-direction - Second Natural Frequency: %.2f Hz\n', second_natural_frequency_hz_node3_ydir);
fprintf('Node4 in X-direction - First Natural Frequency: %.2f Hz\n', first_natural_frequency_hz_node4_xdir);
fprintf('Node4 in X-direction - Second Natural Frequency: %.2f Hz\n', second_natural_frequency_hz_node4_xdir);
fprintf('Node4 in Y-direction - First Natural Frequency: %.2f Hz\n', first_natural_frequency_hz_node4_ydir);
fprintf('Node4 in Y-direction - Second Natural Frequency: %.2f Hz\n', second_natural_frequency_hz_node4_ydir);
