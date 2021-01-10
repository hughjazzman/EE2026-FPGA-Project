# EE2026-FPGA-Project

<img src="fpga.jpg" width="500" />

The EE2026 Module Project was a Sound & Entertainment System built using Verilog, Digilent Basys 3 Board, Pmod OLEDrgb 96 x 64 RGB OLED Display, Pmod MIC3. 
The [Feature List table](#feature-list) below illustrates the features available. This can be viewed with images in the [*User_Guide.pdf*](User_Guide.pdf).
The notable features include Tetris, Pong, and responsiveness to audio which make for an entertaining and interactive experience.

Click the image below for a short informal demo.

[![Project Video](https://img.youtube.com/vi/CGnjNMMosfY/0.jpg)](https://www.youtube.com/watch?v=CGnjNMMosfY)


## Structure
    
    Top_Student.v
    ├── clk_divider.v
    ├── debounce_single_pulse.v
        └── dff.v
    ├── Audio_Capture.v
    ├── Oled_Display.v
    ├── convertXY.v
    ├── intensity.v
        ├── clk_divider.v
        ├── show_digit.v
        ├── show_led.v
        └── multi_1bit.v
    ├── vol_display.v
        ├── color_mux.v
        ├── border.v
        ├── vol_bar.v
        └── oled_mux.v
    ├── pong.v
        ├── airHockeyPaddles.v
        ├── balls.v
        ├── score.v
            └── pt7seg.v
        └── initpong.v
    ├── wave.v
        └── wave_pos.v
    ├── menuGUI.v
    ├── passcode.v
    ├── passcode_display.v
    ├── tetris.v
        ├── tetris_logic.v
            ├── game_clock.v
            ├── calc_cur_blk.v
            ├── calc_test_blk.v
            ├── fullrow.v
            └── rng.v
        ├── convertTetris_xy.v
        ├── boardXYconversion.v
        ├── show_next_blk.v
            └── convertMini_xy.v
        ├── tetris_game_title.v
        └── tetrisPause_screen.v
    ├── changestate.v
    └── final_mux.v

## Feature List
| Features | Description | Inputs |
| :---: | --- | --- |
| Password Lock | Acts as a lock screen. It is the initial display. Anytime the mic records a volume of >= 13, it will display a secret text (EE2026). To lock the “device”, just press *BtnL* on the main menu screen. | Need to input the password in the correct order (**BtnU → BtnD → BtnL → BtnR**) and *while pressing BtnR if mic_in records* something at a **level of >=13** it will unlock and display the menu screen, otherwise will stay locked. |
| Main Menu | Acts as a home screen to switch between the various applications. | **BTNU/BTND** to hover between the options and **BTNC** to select the option. **SW0** will invert the colour scheme. |
| Real Time Audio Volume Indicator (RTAVI) |  Shown in tandem with GV&C. Shows the peak intensity of volume on LEDs and 7-SEG Display | When **SW0 is *off***, Peak Intensity is shown on 15 LEDs, and if **SW0 is *on***, mic_in is shown on 12 LEDs. |
| Graphical Visualizations & Configurations (GV&C) | Shown in tandem with RTAVI. Displays a real time volume bar. | **BTNC** to return to main menu. **SW1** turns on a 1 pixel border, **SW2** turns on a 3 pixel border (priority to SW1). **SW3** will display a second colour scheme and **both SW3 and SW4** will display the third colour scheme. Only turning on **SW4** will hide the volume bar. **SW5** will freeze the volume bar. |
| Audio Wave Visualizer | Display the two different types of audio reactor/wave. | **BTNC** to return to main menu. Toggle **SW0** to switch between the two waveforms. SW0 *on* shows audio values > 2048. SW0 *off* shows middle values around 2048. Turn on *SW1* to freeze waveforms. |
| Ping Pong | A single/2-player ping pong game that can be audio/voice controlled. For a single player game, you need background audio/music to control the paddle. For 2-player, one can use the BTNs and the other can use their voice. The louder you are the higher the paddle will appear on the screen. No sound leaves paddle at bottom. Score recorded on the 7SEG display split by the decimal point. | **BTNC** to return to main menu. **SW0 on** to begin game. **SW0 off** turn off/restart game. Left paddle controlled by **BTNU/BTND**, right paddle controlled by audio. **SW[2:1] is 00:** Normal change in x and y at 1 each; **01:** x changes 2 for every y change 1, 10: x changes 3 for every y change 1, clock is slowed to ensure every unit x change takes the same time (same difficulty). |
| Tetris | Single player classic tetris game. Rotate board 90 degrees clockwise, BTNs are all oriented to make sure it is intuitive to play *(i.e. BTNU → BTNR, BTND → BTNL etc.)*. Any loud audio (e.g. clap) will make block fall faster, next block is shown at the side. | **BTNC** to return to main menu. **SW0 off:** Normal gameplay, rotate, down, left, right using corresponding buttons. **BTNL/BTNR (Tetris)** *(originally BTND/BTNU)* to move Tetris left and right. **BTNU (Tetris)** to rotate Tetris. **BTND (Tetris)** will move the tetris down. **SW0 on:** Pressing **BTND (Tetris)** will instant drop the block. **SW1 on/off:** pause/unpause. When game is over (when the player loses) a game over screen appears and asks if user wants to restart the game. To select no, use **BTND/BTNU (Tetris)** to move to that option, and **BTNC** to select it. To select yes, hover over it and select it by saying *something loudly*. Pressing BTNC will not work and will bring you to the main menu. |
