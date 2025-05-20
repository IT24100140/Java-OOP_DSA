package util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

public final class FileUtil {

    private FileUtil() {} // Prevent instantiation

    // Read all lines from a file and return parsed data
    public static List<String[]> readAll(String path) throws IOException {
        ensureFile(path);
        List<String[]> rows = new ArrayList<>();

        for (String line : Files.readAllLines(Path.of(path))) {
            line = line.trim();
            if (!line.isEmpty()) {
                String[] parts = line.split("\\|");
                if (parts.length >= 2) { // only add valid rows
                    rows.add(parts);
                }
            }
        }

        return rows;
    }

    // Append a line to the file
    public static synchronized void append(String path, String line) throws IOException {
        ensureFile(path);
        Files.writeString(Path.of(path), line + System.lineSeparator(), StandardOpenOption.APPEND);
    }

    // Overwrite file with given lines
    public static synchronized void overwrite(String path, List<String> lines) throws IOException {
        ensureFile(path);
        Files.write(Path.of(path), lines);
    }

    // Create file and directory if missing
    private static void ensureFile(String path) throws IOException {
        Path p = Path.of(path);
        if (Files.notExists(p)) {
            Files.createDirectories(p.getParent());
            Files.createFile(p);
        }
    }
}
