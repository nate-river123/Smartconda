public int getAiDecision(){
	String state = determineState();
	Float[] defaultValue = {0.0,0.0,0.0,0.0};
	Float[] qs = QTable.getOrDefault(state, defaultValue);
	Float maxVal = Math.max(qs[0], Math.max(qs[1], Math.max(qs[2], qs[3])));
	if (maxVal == 0){
		int rnd = new Random().nextInt(4);
		return rnd;
	}
	else {
		for (int i = 0; i < 4; i++)
			if(maxVal == qs[i])
				return i;
	}
	return 0;
}

public String determineState(){
	Float headx, heady, tailx, taily, foodx, foody;
	headx = snake.snakeBodyArr.get(0).getx();
	heady = snake.snakeBodyArr.get(0).gety();
	tailx = snake.snakeBodyArr.get(snake.snakeBodyArr.size()-1).getx();
	taily = snake.snakeBodyArr.get(snake.snakeBodyArr.size()-1).gety();
	foodx = food.getx();
	foody = food.gety();
	String state = "" + (foodx - headx) + "," + (foody - heady) + ";" + (tailx - headx) + "," + (taily - heady);
	return state;
}

public void updateQTable(String stateBeforeTakingStep, String stateAfterTakingStep, Integer decision, Float reward){
	Float[] defaultValue = {0.0,0.0,0.0,0.0};
	Float[] qs = QTable.getOrDefault(stateBeforeTakingStep, defaultValue);
	Float[] qs1 = QTable.getOrDefault(stateAfterTakingStep, defaultValue);
	Float maxVal = Math.max(qs1[0], Math.max(qs1[1], Math.max(qs1[2], qs1[3])));
	Float alpha = 0.85, discount = 0.9;
	qs[decision] = qs[decision] + alpha * (reward + discount * (maxVal - qs[decision]));
	QTable.put(stateBeforeTakingStep, qs);	
}