always_comb begin
        Ball_Y_Motion_next = Ball_Y_Motion; // set default motion to be same as prev clock cycle
        Ball_X_Motion_next = Ball_X_Motion;

        //modify to control ball motion with the keycode
        // W = hex 1A, S = hex 16
        if (keycode == 8'h1A) //W: up
            Ball_Y_Motion_next = -10'd1;
  if (keycode == 8'h16) //S: down
            Ball_Y_Motion_next = -10'd1;
        if ( (BallY + BallS) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
        begin
            Ball_Y_Motion_next = (~ (Ball_Y_Step) + 1'b1);  // set to -1 via 2's complement.
        end
        else if ( (BallY - BallS) <= Ball_Y_Min )  // Ball is at the top edge, BOUNCE!
        begin
            Ball_Y_Motion_next = Ball_Y_Step;
        end  
       //fill in the rest of the motion equations here to bounce left and right
        // A = hex 4 , D = hex 7
  if (keycode == 4'h04) //A: left
            Ball_X_Motion_next = -10'd1;
  if (keycode == 4'h07) //D: right
            Ball_X_Motion_next = -10'd1;

        if ( (BallX + BallS) >= Ball_X_Max )  // Ball is at the bottom edge, BOUNCE!
        begin
            Ball_X_Motion_next = (~ (Ball_X_Step) + 1'b1);  // set to -1 via 2's complement.
        end
        else if ( (BallX - BallS) <= Ball_X_Min )  // Ball is at the top edge, BOUNCE!
        begin
            Ball_X_Motion_next = Ball_X_Step;
        end  
    end
