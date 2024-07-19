function cosine_signal = shift_sine_to_cosine(sine_signal)
    cosine_signal = sin(asin(sine_signal) + pi/2);
end