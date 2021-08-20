import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Random;
import java.util.stream.IntStream; 

int direction;
int x;
int y;
int length;
int xFood;
int yFood;
int[] SnakeHead = {1, 0};
int[] TempArray = {0, 0};
List<int[]> SnakeBody = new ArrayList<int[]>();
boolean FoodStatus = false;

Random rand = new Random();

void setup(){
    size(500, 500);
    direction = 0;
    x = 0;
    y = 0;
    length = 2;
    
    SnakeBody.add(TempArray.clone());
    SnakeBody.add(SnakeHead.clone());

    xFood = rand.nextInt(20) * 25;
    yFood = rand.nextInt(20) * 25;
}

void draw(){
    try {
    Thread.sleep(200);
    }
    catch(InterruptedException e) {
        System.out.println("got interrupted!");
    }

    background(51);

    // food drawing
    fill(255, 0, 0);
    square(xFood, yFood, 25);

    fill(0, 128, 0);
    //drawing snake
    for (int i = 0; i < length; i++) {
        square(SnakeBody.get(i)[0] * 25, SnakeBody.get(i)[1] * 25, 25); //this is the head

        if (i != length - 1){
            if (SnakeBody.get(i)[0] == SnakeHead[0] && SnakeBody.get(i)[1] == SnakeHead[1]){
                exit();
            }
        }
        
    }

    if (keyPressed) {
        TranslationIntoDirection();
    }

    if (SnakeHead[0] * 25 == xFood && SnakeHead[1] * 25 == yFood){
        length += 1;
        xFood = rand.nextInt(20) * 25;
        yFood = rand.nextInt(20) * 25;

        FoodStatus = true;
        System.out.println("food");

    }

    DirectionApplied();

}

void TranslationIntoDirection(){
    if (key == 'd' && direction != 2){
        direction = 1;
    }
    if (key == 'a' && direction != 1){
        direction = 2;
    }
    if (key == 'w' && direction != 4){
        direction = 3;
    }
    if (key == 's' && direction != 3){
        direction = 4;
    }
}

void DirectionApplied(){
    if (direction == 1){
        if (SnakeHead[0] * 25 >= 500){
            exit();
        }
        SnakeBody.remove(0);
        TempArray = SnakeHead.clone();
        TempArray[0] += 1;
        SnakeHead = TempArray.clone();
        SnakeBody.add(TempArray.clone());

        if (FoodStatus == true){
            TempArray = SnakeHead.clone();
            TempArray[0] += 1;
            SnakeHead = TempArray.clone();
            SnakeBody.add(TempArray.clone());
            FoodStatus = false;
        }
    } 
    if (direction == 2){
        if (SnakeHead[0] * 25 <= 0){
            exit();
        }
        //SnakeHead[0] -= 1;
        SnakeBody.remove(0);
        TempArray = SnakeHead.clone();
        TempArray[0] -= 1;
        SnakeHead = TempArray.clone();
        SnakeBody.add(TempArray.clone());

        if (FoodStatus == true){
            TempArray = SnakeHead.clone();
            TempArray[0] -= 1;
            SnakeHead = TempArray.clone();
            SnakeBody.add(TempArray.clone());
            FoodStatus = false;
        }
    } 
    if (direction == 3){
        if (SnakeHead[1] * 25 <= 0){
            exit();
        }
        //SnakeHead[1] -= 1;
        SnakeBody.remove(0);
        TempArray = SnakeHead.clone();
        TempArray[1] -= 1;
        SnakeHead = TempArray.clone();
        SnakeBody.add(TempArray.clone());

        if (FoodStatus == true){
            TempArray = SnakeHead.clone();
            TempArray[1] -= 1;
            SnakeHead = TempArray.clone();
            SnakeBody.add(TempArray.clone());
            FoodStatus = false;
        }
    } 
    if (direction == 4){
        if (SnakeHead[1] * 25 >= 500){
            exit();
        }
        //SnakeHead[1] += 1;
        SnakeBody.remove(0);
        TempArray = SnakeHead.clone();
        TempArray[1] += 1;
        SnakeHead = TempArray.clone();
        SnakeBody.add(TempArray.clone());

        if (FoodStatus == true){
            TempArray = SnakeHead.clone();
            TempArray[1] += 1;
            SnakeHead = TempArray.clone();
            SnakeBody.add(TempArray.clone());
            FoodStatus = false;
        }
    } 
}

