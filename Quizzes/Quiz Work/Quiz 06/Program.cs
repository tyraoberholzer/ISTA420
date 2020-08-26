using System;


namespace Quiz_06
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] cardArray = new int[4, 13];
            int individualCard = 0;
            Console.WriteLine("This is Cards-console\n");
            Console.WriteLine("initialize new deck=================================");
            for (int suits = 0; suits < 4; suits++)
            {
                for (int value = 0; value < 13; value++)
                {
                    cardArray[suits, value] = individualCard;
                    assignCards(individualCard);
                    if (individualCard < cardArray.Length - 1)
                        Console.Write(", ");
                    individualCard++;

                }
            }
           
            Console.WriteLine("\n");
            Console.WriteLine("deal from new deck===================================");
            dealHands();
            Console.WriteLine("all done=============================================");
        }
        private static void dealHands()
        {
            int rdmCard = 0;
            //int numDealt = 0;
            int[] deck = new int[52];
            for (int i = 0; i < 13; i++)
            {
                for (int j = 0; j < 4; j++)
                {
                    do
                    {
                        Random card = new Random();
                        rdmCard = card.Next(52);
                    }
                    while (deck[rdmCard] >= 100);
                    switch(j)
                    {
                        case 0:
                            Console.Write("--Norh-- ");
                            break;
                        case 1:
                            Console.Write("--East-- ");
                            break;
                        case 2:
                            Console.Write("--West-- ");
                            break;
                        case 3:
                            Console.Write("--South-- ");
                            break;
                    }
                    assignCards2(rdmCard);
                    deck[rdmCard] = 101;

                }
            }
        }
        private static void assignCards(int cardNum)
        {
            int value = cardNum % 13;
            switch (value)
            {
                case 12:
                    Console.Write("Ace ");
                    break;
                case 11:
                    Console.Write("King ");
                    break;
                case 10:
                    Console.Write("Queen ");
                    break;
                case 9:
                    Console.Write("Jack ");
                    break;
                case 8:
                    Console.Write("Ten ");
                    break;
                case 7:
                    Console.Write("Nine ");
                    break;
                case 6:
                    Console.Write("Eight ");
                    break;
                case 5:
                    Console.Write("Seven ");
                    break;
                case 4:
                    Console.Write("Six ");
                    break;
                case 3:
                    Console.Write("Five ");
                    break;
                case 2:
                    Console.Write("Four ");
                    break;
                case 1:
                    Console.Write("Three ");
                    break;
                case 0:
                    Console.Write("Two ");
                    break;
            }
            int suit = cardNum / 13;
            if (suit == 0)
                Console.Write("of Clubs");
            if (suit == 1)
                Console.Write("of Diamonds");
            if (suit == 2)
                Console.Write("of Hearts");
            if (suit == 3)
                Console.Write("of Spades");
        }
        private static void assignCards2(int cardNum)
        {
            int value = cardNum % 13;
            switch(value)
            {
                case 12:
                    Console.Write("Ace ");
                    break;
                case 11:
                    Console.Write("King ");
                    break;
                case 10:
                    Console.Write("Queen ");
                    break;
                case 9:
                    Console.Write("Jack ");
                    break;
                case 8:
                    Console.Write("Ten ");
                    break;
                case 7:
                    Console.Write("Nine ");
                    break;
                case 6:
                    Console.Write("Eight ");
                    break;
                case 5:
                    Console.Write("Seven ");
                    break;
                case 4:
                    Console.Write("Six ");
                    break;
                case 3:
                    Console.Write("Five ");
                    break;
                case 2:
                    Console.Write("Four ");
                    break;
                case 1:
                    Console.Write("Three ");
                    break;
                case 0:
                    Console.Write("Two ");
                    break;
            }
            int suit = cardNum / 13;
            if (suit == 0)
                Console.WriteLine("of Clubs");
            if (suit == 1)
                Console.WriteLine("of Diamonds");
            if (suit == 2)
                Console.WriteLine("of Hearts");
            if (suit == 3)
                Console.WriteLine("of Spades");
        }
       
        
    }
}

