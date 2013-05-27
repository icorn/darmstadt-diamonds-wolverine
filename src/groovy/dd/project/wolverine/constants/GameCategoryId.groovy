/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dd.project.wolverine.constants

/**
 *
 * @author oli
 */
public enum GameCategoryId {
    REGULAR_SEASON(1),
    PRE_SEASON(2),
    PLAYOFF(3),
    RELEGATION(4),
    BOWL(5)

    private final long value

    GameCategoryId(int value) {
        this.value = value
    }

    public long getValue() { return value }

}