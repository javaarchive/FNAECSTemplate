using FNAECSTemplate;

static class Program
{
    static void Main()
    {
        using var game = new Game1();
        game.OnAudioAllowedToInit();
        game.Run();
    }
}