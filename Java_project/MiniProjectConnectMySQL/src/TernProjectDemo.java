public class TernProjectDemo {
    public static void main(String[] args) {
        System.out.println("선택");
        TernProjectPolls polls = new TernProjectPolls();    // class를 인스턴스화 시킴
        int val = polls.PollFunction(); // polls는 return이 있기 때문에 변수 선언해줘서 받을 공간을 만들어야 됨
        TernProjectStatistic statistic = new TernProjectStatistic();
        String str = statistic.StatisticFuction();
        return;
    }
    
}
